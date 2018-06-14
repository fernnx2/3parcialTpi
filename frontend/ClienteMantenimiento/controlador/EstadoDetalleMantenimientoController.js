import EstadoDetalleMantenimientoResourceClient from '../resources/EstadoDetalleMantenimientoResourceClient.js'

class EstadoDetalleMantenimientoController {
    constructor(){

    }

    findMantenimientosTerminados(){
        console.log("se inicio la peticion!");
        this.edrc = new EstadoDetalleMantenimientoResourceClient();

       return this.edrc.mantenimientosTerminados().then(function(response){
            if(response.ok){
                return response.json();
            }
            else{
                console.log("Error en la peticion");
            }
        });
    }

    findMantenimientosNoTerminados(){
        console.log("se inicio la peticion!");
        this.edrc = new EstadoDetalleMantenimientoResourceClient();

       return  this.edrc.mantenimientosNoTerminados().then(function(response){
            if(response.ok){
              return response.json();
            }
            else{
                console.log("Error en la peticion");
            }
        });
    }


}
let e = new EstadoDetalleMantenimientoController();
export default e;