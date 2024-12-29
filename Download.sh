#!/bin/bash

# Actualización del sistema
echo "Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

# Verificar si Localtonet ya está instalado en el directorio padre
if [ -f "../localtonet" ]; then
  echo "El programa Localtonet ya existe en el directorio padre. No se realizará ninguna acción adicional."
else
  echo "Localtonet no encontrado en el directorio padre. Procediendo con la descarga e instalación..."

  # Descargar Localtonet en el directorio actual y luego moverlo
  if ! wget -O localtonet-linux-arm64.zip "https://localtonet.com/download/localtonet-linux-arm64.zip"; then
    echo "Error al descargar Localtonet. Verifica tu conexión a Internet."
    exit 1
  fi

  # Descomprimir el archivo zip en el directorio actual
  if ! unzip localtonet-linux-arm64.zip; then
    echo "Error al descomprimir el archivo zip. Asegúrate de tener instalado unzip."
    rm -f localtonet-linux-arm64.zip
    exit 1
  fi

  # Mover el archivo localtonet al directorio padre
  if ! mv localtonet ../; then
    echo "Error al mover localtonet al directorio padre."
    rm -f localtonet
    rm -f localtonet-linux-arm64.zip
    exit 1
  fi

  # Dar permisos de ejecución al binario de Localtonet en el directorio padre
  if ! chmod +x ../localtonet; then
    echo "Error al dar permisos al ejecutable de Localtonet en el directorio padre."
    rm -f ../localtonet
    exit 1
  fi

  # Limpieza del archivo zip después de extraerlo
  rm -f localtonet-linux-arm64.zip

  echo "Localtonet ha sido descargado, descomprimido y movido al directorio padre."
fi
