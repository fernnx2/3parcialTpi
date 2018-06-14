function getData(){
           let descripcion =document.querySelector('#descripcion').value;
           let email =document.querySelector('#email').value;
           let equipo =document.querySelector('#equipo').value;
           let fecha =document.querySelector('#fecha').value;
           //let descripcion =document.querySelector('#idSolicitud').value;
           let responsable =document.querySelector('#responsable').value;
           let telefono =document.querySelector('#telefono').value;
           let tipoMantenimiento =document.querySelector('#tipoMantenimiento').value;
        
           let ticket = this.getTicket();
        
           ticket.then(function(response){
            let data = {"descripcion":`${descripcion}`,
            "email":`${email}`,
            "equipoIdEquipo":{"idEquipo":`${equipo}`},
            "fecha":`${fecha}`,
            "idSolicitud":response.ticket,
            "responsable":`${responsable}`,
            "telefono":`${telefono}`,
            "tipoMantenimientoIdTipoMantenimiento":{"idTipoMantenimiento":`${tipoMantenimiento}`}}
            
            this.post(data);
            
           }).catch(function(err){
               console.log(err);
           });
           
            
            }

           
        function getTicket(){

               let data=fetch('http://localhost:8080/MantenimientoTpi-1.0-SNAPSHOT/webresources/solicitud/generarticket');
               return data.then(function(response){
                   return response.json();
               }).catch(function(err){
                   console.log(err);
               }) ;
            }


           function post(data){
                fetch('http://localhost:8080/MantenimientoTpi-1.0-SNAPSHOT/webresources/solicitud',{
                    method: 'POST',
                    headers:{
                        'Content-Type':'application/json',
                        'accept':'application/json'
                    },
                    body: JSON.stringify(data),
                    
                }).then(function(response){
                    let mensaje =document.querySelector('#nTicket');
                    mensaje.innerHTML = "Su numero de Ticket es :" + data.idSolicitud;
                    console.log(response);
                    
                }).catch(function(err){
                    console.error(err);
                });
            }