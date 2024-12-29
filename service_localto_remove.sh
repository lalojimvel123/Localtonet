#!/bin/bash

# Función para mostrar mensajes con formato
echo_formatted() {
  echo -e "\033[1;32m$1\033[0m"
}

# Verificar permisos de root
if [ "$EUID" -ne 0 ]; then
  echo_formatted "Por favor, ejecuta este script como superusuario (root)."
  exit 1
fi

# Definir la carpeta donde están los archivos de Localtonet
CURRENT_DIR=$(pwd)
PARENT_DIR=$(dirname "$CURRENT_DIR")
LOCALTONET_DIR="$PARENT_DIR/localtonet"

# Detener el servicio
stop_service() {
  echo_formatted "Deteniendo el servicio Localtonet..."
  if systemctl is-active --quiet localtonet.service; then
    systemctl stop localtonet.service
    echo_formatted "Servicio detenido."
  else
    echo_formatted "El servicio no está activo."
  fi
}

# Deshabilitar el servicio
disable_service() {
  echo_formatted "Deshabilitando el servicio Localtonet..."
  if systemctl is-enabled --quiet localtonet.service; then
    systemctl disable localtonet.service
    echo_formatted "Servicio deshabilitado."
  else
    echo_formatted "El servicio ya estaba deshabilitado."
  fi
}

# Eliminar el archivo del servicio
remove_service_file() {
  echo_formatted "Eliminando el archivo del servicio Localtonet..."
  SERVICE_FILE="/etc/systemd/system/localtonet.service"
  if [ -f "$SERVICE_FILE" ]; then
    rm -f "$SERVICE_FILE"
    echo_formatted "Archivo del servicio eliminado."
  else
    echo_formatted "El archivo del servicio no existe."
  fi
}

# Recargar systemd para reflejar los cambios
reload_systemd() {
  echo_formatted "Recargando systemd..."
  systemctl daemon-reload
  echo_formatted "systemd recargado."
}

# Eliminar archivos relacionados con Localtonet
remove_localtonet_files() {
  if [ -d "$LOCALTONET_DIR" ]; then
    echo_formatted "\n¿Deseas eliminar los archivos de Localtonet ubicados en $LOCALTONET_DIR? [s/n]"
    read -r respuesta
    case "$respuesta" in
      s|S)
        echo_formatted "Eliminando archivos de Localtonet..."
        rm -rf "$LOCALTONET_DIR"
        echo_formatted "Archivos de Localtonet eliminados."
        ;;
      n|N)
        echo_formatted "Archivos de Localtonet conservados."
        ;;
      *)
        echo_formatted "Opción no válida. Conservando los archivos de Localtonet."
        ;;
    esac
  else
    echo_formatted "No se encontraron archivos de Localtonet en $LOCALTONET_DIR."
  fi
}

# Llamar a las funciones
stop_service
disable_service
remove_service_file
reload_systemd
remove_localtonet_files

echo_formatted "El servicio Localtonet ha sido eliminado."
