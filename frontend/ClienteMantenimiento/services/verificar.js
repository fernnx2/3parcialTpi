
import o from '../controlador/SolicitudController.js';

let buttonVerificar = document.querySelector('#verificar');
let tiket = document.querySelector('#ticket');



var estadoSol = angular.module('estadoSol', []);
estadoSol.controller('ver', function($scope) {
    $scope.datos ;
    $scope.datos2;
    buttonVerificar.onclick = function(){
        $scope.datos2 =[];
        let estado = o.findEstadoSolicitud(tiket.value);
        let solicitud = o.findSolicitud(tiket.value);
    estado.then(function(response) {
        console.log(response);
        $scope.$apply(function(){
            $scope.datos = response.estado;
            
        });
      
    }, function(err) {
        console.log(err);
    });
    solicitud.then(function(response) {
        console.log(response);
        $scope.$apply(function(){
            $scope.datos2.push(response);
        });
       
    }, function(err) {
        console.log(err);
    });
     
    }
   
    
});