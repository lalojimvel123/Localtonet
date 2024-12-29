!/bin/bash

# Función para mostrar mensajes con formato
echo_formatted() {
  echo -e "\033[1;32m$1\033[0m"
}

# Función principal para el menú
main_menu() {
  while true; do
    echo_formatted "\nMenú de ejecución:"
    PS3="Elige tu opción: "
    opciones=("Instalar Localto" "Regresar")
    select opt in "${opciones[@]}"
    do
      case $opt in
        "Instalar Localto")
          bash "Install_localto.sh"
          ;;
        "Salir y limpiar")
          echo_formatted "Regresando..."
          bash main.sh
          exit 0
          ;;
        *) echo_formatted "Opción no válida."
          ;;
      esac
      break
    done
  done
}
# Llamar al menú principal
main_menu
