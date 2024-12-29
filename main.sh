#!/bin/bash

# Función para mostrar mensajes con formato
echo_formatted() {
  echo -e "\033[1;32m$1\033[0m"
}

# Función para descargar y ejecutar scripts
download_and_run() {
  local script_name="$1"
  local script_url="URL_BASE/${script_name}"  # Ajusta 'URL_BASE' a tu repositorio de GitHub o URL donde se encuentran los scripts

  echo_formatted "Descargando y ejecutando $script_name..."
  
  if ! wget -q "$script_url" -O "/tmp/$script_name"; then
    echo_formatted "Error al descargar $script_name. Verifica la URL y tu conexión a Internet."
    return 1
  fi

  chmod +x "/tmp/$script_name"
  if ! "/tmp/$script_name"; then
    echo_formatted "Error al ejecutar $script_name."
  fi
  
  rm -f "/tmp/$script_name"  # Limpiar el archivo descargado después de su uso
}

# Función principal para el menú
main_menu() {
  while true; do
    echo_formatted "\nMenú de ejecución:"
    PS3="Elige tu opción: "
    opciones=("Instalar Localto" "Configurar puertos" "Configurar Token" "Desinstalar Localto" "Salir")
    select opt in "${opciones[@]}"
    do
      case $opt in
        "Instalar Localto")
          download_and_run "Install_localto.sh"
          ;;
        "Configurar puertos")
          download_and_run "Port_config.sh"
          ;;
        "Configurar Token")
          download_and_run "Token_config.sh"
          ;;
        "Desinstalar Localto")
          download_and_run "Uninstall_Localto.sh"
          ;;
        "Salir")
          echo_formatted "Saliendo del menú."
          return
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
