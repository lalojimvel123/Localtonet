#!/bin/bash

# Script para configurar puertos en Localtonet

# Comprobar si Localtonet está instalado
if [ ! -f "./localtonet" ]; then
  echo "Localtonet no encontrado. Descargando..."
  
  # Descargar el archivo zip de Localtonet
  if ! wget -O localtonet.zip "https://localtonet.com/download/localtonet-linux-x64.zip"; then
    echo "Error al descargar Localtonet. Verifica tu conexión a Internet."
    exit 1
  fi

  # Extraer el archivo zip
  if ! unzip localtonet.zip; then
    echo "Error al descomprimir el archivo zip. Asegúrate de tener instalado unzip."
    rm -f localtonet.zip
    exit 1
  fi

  # Dar permisos de ejecución al binario de Localtonet
  if ! chmod +x localtonet; then
    echo "Error al dar permisos al ejecutable de Localtonet."
    rm -f localtonet
    rm -f localtonet.zip
    exit 1
  fi

  # Limpieza del archivo zip después de extraerlo
  rm -f localtonet.zip

  echo "Localtonet ha sido descargado e instalado."
fi

# Preguntar al usuario cuál puerto quiere configurar
read -p "Introduce el puerto que deseas usar para Localtonet (por defecto 8080): " PORT
PORT=${PORT:-8080}

# Verificar si el puerto es un número válido
if ! [[ "$PORT" =~ ^[0-9]+$ ]]; then
  echo "Error: El puerto debe ser un número."
  exit 1
fi

# Ejecutar Localtonet con el puerto configurado
echo "Iniciando Localtonet en el puerto $PORT..."
if ! ./localtonet -port $PORT authtoken TU_AUTHTOKEN; then
  echo "Error al iniciar Localtonet. Asegúrate de que TU_AUTHTOKEN está correctamente configurado."
  exit 1
fi

echo "Localtonet está corriendo en el puerto $PORT. No cierres esta terminal para mantenerlo en ejecución."
