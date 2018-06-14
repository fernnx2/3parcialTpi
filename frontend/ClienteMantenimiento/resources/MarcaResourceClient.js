import AbstractResourceClient from './AbstractResourceClient.js';
class MarcaResourceClient extends AbstractResourceClient{

    constructor(){
        super();
        this.url += "marca";

    }

    findAllMarca() {
        return fetch(this.url);
    }
    findByName(nombre){
        return fetch(this.url+"marca/marca" + nombre);
    }

}

export default MarcaResourceClient;