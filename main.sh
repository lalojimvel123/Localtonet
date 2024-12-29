#!/bin/bash

# Función para mostrar mensajes con formato
echo_formatted() {
  echo -e "\033[1;32m$1\033[0m"
}

# Función para limpiar el directorio actual
clean_up() {
  local current_dir=$(pwd)
  local parent_dir=$(dirname "$current_dir")
  echo_formatted "Limpiando el directorio $current_dir..."
  cd "$parent_dir" || exit 1
  rm -rf "$current_dir"
  echo_formatted "Directorio eliminado."
}
# Descarga del programa
Dowload(){
  bash "Download.sh"
}
# Función principal para el menú
main_menu() {
  while true; do
    echo_formatted "\nMenú de ejecución:"
    PS3="Elige tu opción: "
    opciones=("Configurar Localto" "Configurar Servicio" "Desinstalar Localto" "Salir y limpiar")
    select opt in "${opciones[@]}"
    do
      case $opt in
        "Configurar Localto")
          bash "localto_config/localto_main.sh"
          ;;
        "Configurar Servicio")
          bash "Port_config.sh"
          ;;
        "Desinstalar Localto")
          bash "Token_config.sh"
          ;;
        "Salir y limpiar")
          echo_formatted "Saliendo del menú y limpiando..."
          clean_up
          exit 0
          ;;
        *) echo_formatted "Opción no válida."
          ;;
      esac
      break
    done
  done
}
#Descarga los archivos necesarios
Dowload
# Llamar al menú principal
main_menu
