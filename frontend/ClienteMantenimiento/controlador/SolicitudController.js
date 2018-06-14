import SolicitudResourceClient from '../resources/SolicitudResourceClient.js'

class SolicitudController {

    constructor(){}

    findEstadoSolicitud(idSolicitud){

        console.log("se inicio el proceso!");
        this.orc = new SolicitudResourceClient();
       
       return  this.orc.estadoSolicitud(idSolicitud).then(function(response){
            if(response.ok){
             return  response.json();
            }
            else{
                console.log("Error en la peticion");
            }

        });
        
    }


    findSolicitud(idSolicitud){
        console.log("se inicio el proceso!");
        this.orc = new SolicitudResourceClient();
        
      return  this.orc.solicitud(idSolicitud).then(function(response){
            if(response.ok){
             return response.json();  
            }
            else{
                console.log("Error en la peticion");
            }
        }); 
        
    }
}
var o = new SolicitudController();
export default o;