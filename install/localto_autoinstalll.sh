#!/bin/bash

# Actualización del sistema
sudo apt update && sudo apt upgrade -y

# Descargar zip de localto
wget -O localtonet-linux-arm64.zip "https://localtonet.com/download/localtonet-linux-arm64.zip"

# Decomprime zip de localto
unzip localtonet-linux-arm64.zip 

# Borra zip de localto
rm -f localtonet-linux-arm64.zip


# Dar permisos de ejecución al binario de Localtonet en el directorio padre
chmod +x ../localtonet

#Ejecuta aplicacion
./localtonet
