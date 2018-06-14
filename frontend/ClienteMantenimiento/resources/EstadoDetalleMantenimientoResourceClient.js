import AbstractResourceClient from './AbstractResourceClient.js';

class EstadoDetalleMantenimientoResourceClient extends AbstractResourceClient {

    constructor(){
        super();
        this.url += "estadodetallemantenimiento";
    }

    allMantenimientos(){
       return fetch(this.url);
    }

    mantenimientosTerminados(){
        return fetch(this.url + "/estado/terminado");
    }

    mantenimientosNoTerminados(){
        return fetch(this.url + "/estado/noterminado");
    }


} 
export default EstadoDetalleMantenimientoResourceClient;