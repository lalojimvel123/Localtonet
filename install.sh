#!/bin/bash

# Localtonet Installer Script for ARM64

# Clonar el repositorio Localtonet
echo "Clonando el repositorio Localtonet..."
if ! git clone https://github.com/lalojimvel123/Localtonet.git; then
  echo "Error al clonar el repositorio. Verifica tu conexión a Internet o la URL del repositorio."
  exit 1
fi

cd ./Localtonet/ || { echo "Error al cambiar al directorio Localtonet."; exit 1; }

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
if ! chmod +x localtonet; then
  echo "Error al dar permisos al ejecutable de Localtonet."
  rm -f localtonet
  rm -f localtonet.zip
  exit 1
fi

# Limpieza del archivo zip después de extraerlo
rm -f localtonet.zip

echo "Localtonet descargado y configurado. Ejecutando main.sh..."

# Ejecutar main.sh desde el mismo directorio
if ! bash main.sh; then
  echo "Error al ejecutar main.sh."
  exit 1
fi
