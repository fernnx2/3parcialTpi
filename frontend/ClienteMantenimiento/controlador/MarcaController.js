import MarcaResourceClient from '../services/MarcaResourceClient.js';
class MarcaController {

    constructor(){
      
     
    }

    findAllResource(){
        console.log("se inicio el proceso");
        this.mrc = new MarcaResourceClient();
        this.mrc.findAllMarca().then(function(response){
            if(response.ok){
               console.log(response.text());
               
               console.log("fin del proceso");
               
            }
            else{
             console.log("error en la peticion");
            }
       });
    }

   
}
let a = new MarcaController();
export default a.findAllResource();