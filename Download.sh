#!/bin/bash

# Actualización del sistema
echo "Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

# Verificar si Localtonet ya está instalado
if [ -f "localtonet" ]; then
  echo "El programa Localtonet ya existe en esta carpeta. No se realizará ninguna acción adicional."
else
  echo "Localtonet no encontrado. Procediendo con la descarga e instalación..."

  # Descargar Localtonet
  if ! wget https://localtonet.com/download/localtonet-linux-arm64.zip; then
    echo "Error al descargar Localtonet. Verifica tu conexión a Internet."
    exit 1
  fi

  # Descomprimir el archivo zip
  if ! unzip localtonet-linux-arm64.zip; then
    echo "Error al descomprimir el archivo zip. Asegúrate de tener instalado unzip."
    rm -f localtonet-linux-arm64.zip
    exit 1
  fi

  # Dar permisos de ejecución al binario de Localtonet
  if ! chmod +x localtonet; then
    echo "Error al dar permisos al ejecutable de Localtonet."
    rm -f localtonet
    rm -f localtonet-linux-arm64.zip
    exit 1
  fi

  # Limpieza del archivo zip después de extraerlo
  rm -f localtonet-linux-arm64.zip

  echo "Localtonet ha sido descargado y descomprimido."
fi
