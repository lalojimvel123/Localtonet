#!/bin/bash

# Función para mostrar mensajes con formato
echo_formatted() {
  echo -e "\033[1;32m$1\033[0m"
}

# Crear el archivo del servicio
create_service() {
  echo_formatted "Creando el archivo del servicio para Localtonet..."

  # Ruta absoluta del script de Localtonet
  local script_path=$(realpath ../localtonet)

  # Verificar si el archivo existe
  if [ ! -f "$script_path" ]; then
    echo_formatted "Error: No se encontró el archivo ejecutable de Localtonet en '$script_path'."
    exit 1
  fi

  # Crear el archivo del servicio
  cat <<EOF | sudo tee /etc/systemd/system/localtonet.service > /dev/null
[Unit]
Description=Servicio Localtonet
After=network.target

[Service]
ExecStart=$script_path
Restart=always
User=$(whoami)
WorkingDirectory=$(dirname "$script_path")

[Install]
WantedBy=multi-user.target
EOF

  echo_formatted "Archivo del servicio creado en /etc/systemd/system/localtonet.service."
}

# Habilitar y arrancar el servicio
enable_and_start_service() {
  echo_formatted "Habilitando y arrancando el servicio..."
  sudo systemctl daemon-reload
  sudo systemctl enable localtonet.service
  sudo systemctl start localtonet.service

  echo_formatted "Servicio habilitado y arrancado."
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

# Ejecutar las funciones
create_service
enable_and_start_service
check_service_status
