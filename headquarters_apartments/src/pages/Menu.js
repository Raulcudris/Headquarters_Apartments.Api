import React, {useEffect} from 'react';
import Cookies from 'universal-cookie';
import '../css/Menu.css';


function Menu(props){
    const cookies = new Cookies();
    const cerraSesion=()=>{
        cookies.remove('id',{path:'/'});
        cookies.remove('username',{path:'/'});
        cookies.remove('name',{path:'/'});
        cookies.remove('birth_date',{path:'/'});
        cookies.remove('cell_phone',{path:'/'});
        cookies.remove('email',{path:'/'});
        cookies.remove('department',{path:'/'});
        cookies.remove('municipality',{path:'/'});
        cookies.remove('neighborhood',{path:'/'});
        cookies.remove('residence_Adress',{path:'/'});
        cookies.remove('residence_Telephone',{path:'/'});
        cookies.remove('password',{path:'/'});
        cookies.remove('confirm_Password',{path:'/'});
        props.history.push("./");
    }
    useEffect(()=>{
        if(!cookies.get('id')){
            props.history.push('./');
        }
          },[]);

    return(
        <div className='containerMenu'>
            <br/>
            <button className='btn btn-danger' onClick={()=>cerrarSesion()}>Cerrar Sesion</button>
            <br/>
            <h5>Id:{cookies.get('id')}</h5>
            <br/>
            <h5>Numero de Documento:{cookies.get('username')}</h5>
            <br/>
            <h5>Nombre Completo:{cookies.get('name')}</h5>
            <br/>
            <h5>Fecha de Nacimiento:{cookies.get('birth_date')}</h5>
            <br/>
            <h5>Celular:{cookies.get('cell_phone')}</h5>
            <br/>
            <h5>Correo Electronico:{cookies.get('email')}</h5>
            <br/>
            <h5>Departamento:{cookies.get('department')}</h5>
            <br/>
            <h5>Municipio:{cookies.get('municipality')}</h5>
            <br/>
            <h5>Barrio:{cookies.get('neighborhood')}</h5>
            <br/>
            <h5>Telefono Fijo:{cookies.get('residence_Telephone')}</h5>           
            <br/>
        </div>
    );
}
export default Menu;