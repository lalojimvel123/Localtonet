#!/bin/bash

# Función para mostrar mensajes con formato
echo_formatted() {
  echo -e "\033[1;32m$1\033[0m"
}

#Elimina el servicio primero
bash ./service_localto_remove.sh

# Función para limpiar el directorio actual
clean_up() {
  local current_dir=$(pwd)
  local parent_dir=$(dirname "$current_dir")
  echo_formatted "Limpiando el directorio $current_dir..."
  cd "$parent_dir" || exit 1
  rm -rf "$current_dir"
  echo_formatted "Directorio eliminado."
}
clean_up
exit
