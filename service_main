#!/bin/bash

# Función para mostrar mensajes con formato
echo_formatted() {
  echo -e "\033[1;32m$1\033[0m"
}

# Menú de Localto
service_menu() {
  while true; do
    echo_formatted "\nMenú de servicio:"
    PS3="Elige tu opción: "
    opciones=("Crear servicio Localto" "Regresar")
    select opt in "${opciones[@]}"
    do
      case $opt in
        "Crear servicio Localto")
          bash "./service_localto_create.sh"
          ;;
        "Regresar")
          echo_formatted "Regresando al menú principal..."
          return # Regresar al menú principal
          ;;
        *) echo_formatted "Opción no válida."
          ;;
      esac
      break
    done
  done
}

# Llamar al menú de Localto
service_menu
