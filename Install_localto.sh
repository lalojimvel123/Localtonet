#!/bin/bash

# Localtonet Installer Script for Linux

# Descargar el archivo zip de Localtonet
echo "Descargando Localtonet..."
if ! wget -O localtonet.zip "https://localtonet.com/download/localtonet-linux-x64.zip"; then
  echo "Error al descargar Localtonet. Verifica tu conexión a Internet."
  exit 1
fi

# Extraer el archivo zip
echo "Extrayendo Localtonet..."
if ! unzip localtonet.zip; then
  echo "Error al descomprimir el archivo zip. Asegúrate de tener instalado unzip."
  rm -f localtonet.zip
  exit 1
fi

# Dar permisos de ejecución al binario de Localtonet
echo "Configurando permisos para el ejecutable de Localtonet..."
if ! chmod 777 localtonet; then
  echo "Error al dar permisos al ejecutable de Localtonet."
  rm -f localtonet
  rm -f localtonet.zip
  exit 1
fi

# Limpieza del archivo zip después de extraerlo
rm -f localtonet.zip

echo "Instalación de Localtonet completada. Recuerda obtener tu AuthToken desde la página de Localtonet y configurarlo."
echo "Para iniciar Localtonet, ejecuta:"
echo "./localtonet authtoken TU_AUTHTOKEN"

# Aquí podrías añadir un paso para que el usuario ingrese su AuthToken y ejecute Localtonet automáticamente, pero por seguridad y simplicidad, se omite.
