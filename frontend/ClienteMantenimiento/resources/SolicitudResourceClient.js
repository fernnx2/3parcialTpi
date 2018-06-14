import AbstractResourceClient from './AbstractResourceClient.js';

class SolicitudResourceClient extends AbstractResourceClient {

    constructor(){
        super();
        this.url += "solicitud"; 
    }

    estadoSolicitud(idSolicitud){
        return fetch(this.url + "/idSolicitud/" + idSolicitud);
    }

    solicitud(idSolicitud){
        return fetch(this.url +"/"+ idSolicitud);
    }

}
export default SolicitudResourceClient;