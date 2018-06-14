import AbstractResourceClient from './AbstractResourceClient.js';

class OrdenTrabajoResourceClient extends AbstractResourceClient {

    constructor(){
        super();
        this.url += "ordentrabajo"; 
    }

    estadoSolicitud(idSolicitud){
        return fetch(this.url + "/idSolicitud/" + idSolicitud);
    }


}
export default OrdenTrabajoResourceClient;