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
        cookies.remove('question_Secret',{path:'/'});
        cookies.remove('answer_Secret',{path:'/'});
        cookies.remove('password',{path:'/'});
        cookies.remove('confirm_Password',{path:'/'});
        props.history.push('./');
    }

    useEffect(()=>{
        if(!cookies.get('id')){
            props.history.push('./');
        }
          },[]);

    return(
        <div className='containerMenu'>
            <br/>
            <button className='btn btn-danger' onClick={()=>cerraSesion()}>Cerrar Sesion</button>          
           
            <br/>
            <h5>Bienvenido Sr:{cookies.get('name')}</h5>
            
            
            <br/>
        </div>
    );
}
export default Menu;