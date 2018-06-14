
import e from '../controlador/EstadoDetalleMantenimientoController.js';

var mantenimiento = angular.module('mantenimiento',[]);
mantenimiento.controller('data', function($scope){
    $scope.rest;
    let mantenimietosTerminados = e.findMantenimientosTerminados();
    mantenimietosTerminados.then(function(response){
        $scope.$apply(function(){
            $scope.rest = response;
            console.log(response);
        });
    });
    
});

mantenimiento.controller('noterminados', function($scope){
    $scope.rest;
    let mantenimietosNoTerminados = e.findMantenimientosNoTerminados();
    mantenimietosNoTerminados.then(function(response){
        $scope.$apply(function(){
            $scope.rest = response;
            console.log(response);
        });
    });
    
});

