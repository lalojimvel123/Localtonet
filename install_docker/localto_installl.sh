#!/bin/sh

# Actualización del sistema
apk update && apk upgrade

# Instala wget y unzip
apk add --no-cache wget unzip

# Descargar zip de localto
wget -O localtonet-linux-arm64.zip "https://localtonet.com/download/localtonet-linux-arm64.zip"

# Decomprime zip de localto
unzip localtonet-linux-arm64.zip

# Borra zip de localto
rm -f localtonet-linux-arm64.zip

# Dar permisos de ejecución al binario de Localtonet 
chmod +x localtonet

# Ejecuta aplicacion - Aquí es donde necesitas automatizar el token
echo "$LOCALTO_TOKEN" | ./localtonet
