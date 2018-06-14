#!/bin/sh

docker rm contenedor_bd
docker rm contenedor_midleware
docker rm contenedor_frontend

docker rmi microbd
docker rmi microserver
docker rmi apacheserver






