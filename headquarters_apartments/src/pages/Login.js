import React, {useState, useEffect} from 'react';
import md5 from 'md5';
import 'bootstrap/dist/css/bootstrap.min.css';
import Cookies from 'universal-cookie';
import axios from 'axios';
import '../css/Login.css';

function Login(){
//Llamado de la api
const baseUrl="https://localhost:44348/api/Users";
const cookies = new Cookies();


const [form, setForm]= useState({
    username:'',
    password:''
});

const handleChange=e=>{
const {name,value}= e.target;
setForm({
    ...form,
    [name]:value
});
console.log(form);
}

const iniciarSesion=async()=>{
    await axios.get(baseUrl+`/${form.username}/${md5(form.password)}`)
    .then(response=>{
        return response.data;
    }).then(response=>{
        if(response.length>0){
            var respuesta = response[0];           
            cookies.set('id', respuesta.id, {path: '/'});
            cookies.set('username', respuesta.username, {path: '/'});
            cookies.set('name', respuesta.name, {path: '/'});
            cookies.set('birth_date', respuesta.birth_date, {path: '/'});
            cookies.set('cell_phone', respuesta.cell_phone, {path: '/'});
            cookies.set('email', respuesta.email, {path: '/'});
            cookies.set('department', respuesta.department, {path: '/'});
            cookies.set('municipality', respuesta.email, {path: '/'});
            cookies.set('neighborhood', respuesta.department, {path: '/'});
            cookies.set('residence_Adress', respuesta.email, {path: '/'});
            cookies.set('residence_Telephone', respuesta.department, {path: '/'});
            cookies.set('password', respuesta.email, {path: '/'});
            cookies.set('confirm_Password', respuesta.department, {path: '/'});
            alert("Bienvenido : "+respuesta.name);
            console.log(respuesta);
            props.history.push('/menu');
        }else{
            alert("El usuario o la Clave no son Correctos");
        }
    }).catch(error=>{
        console.log(error);
    })
}
useEffect(()=>{
if(cookies.get('id')){
    props.history.push('/menu');
}
},[]);

    return(
        <div className="containerPrincipal">
            <div className="containerLogin">
                <div className="form-group">
                    <label>Usuario:</label>
                    <br/>
                    <input 
                        type="text"
                        className="form-control"
                        name="username" 
                        onChange={handleChange}   
                    />
                    <br/>    
                    <label>Clave:</label>
                    <br/>
                    <input 
                        type="password"
                        className="form-control"
                        name="password"   
                        onChange={handleChange}    
                    />
                    <br/>
                     <button className="btn btn-primary" onClick={()=>iniciarSesion()}>Iniciar Sesion</button>   
                </div>
            </div>
        </div>
    );
}
export default Login;