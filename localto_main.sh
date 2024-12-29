#!/bin/bash

# Función para mostrar mensajes con formato
echo_formatted() {
  echo -e "\033[1;32m$1\033[0m"
}

# Menú de Localto
localto_menu() {
  while true; do
    echo_formatted "\nMenú de Localto:"
    PS3="Elige tu opción: "
    opciones=("Instalar Localto" "Regresar")
    select opt in "${opciones[@]}"
    do
      case $opt in
        "Instalar Localto")
          bash "./localto_install.sh"
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
localto_menu
