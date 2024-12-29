#!/bin/bash

# Función para mostrar mensajes con formato
echo_formatted() {
  echo -e "\033[1;32m$1\033[0m"
}

# Estado del servicio
check_service_status() {
  echo_formatted "Estado del servicio Localtonet:"
  if systemctl is-active --quiet localtonet.service; then
    echo_formatted "El servicio está activo y funcionando correctamente."
  else
    echo_formatted "El servicio no está activo. Verifique con: sudo systemctl status localtonet.service"
  fi
}

check_service_status
