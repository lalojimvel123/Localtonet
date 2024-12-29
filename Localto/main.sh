#!/bin/bash

# Localtonet Installer Script for ARM64
# Ejecuta este script con: 
# wget -O - https://raw.githubusercontent.com/lalojimvel123/Localto/main/main.sh | sudo bash

set -e

# Variables
LOCALTONET_URL="https://localtonet.com/download/localtonet-linux-arm64.zip"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/localtonet"
SERVICE_FILE="/etc/systemd/system/localtonet.service"

echo "=== Instalación de Localtonet para ARM64 ==="

# Verificar arquitectura del sistema
ARCH=$(uname -m)
if [[ "$ARCH" != "aarch64" ]]; then
    echo "Error: Este script solo es compatible con arquitecturas ARM64 (aarch64)."
    exit 1
fi

# Crear directorios necesarios
echo "Creando directorios de configuración..."
mkdir -p $CONFIG_DIR
chmod 755 $CONFIG_DIR

# Descargar y extraer Localtonet
echo "Descargando Localtonet..."
wget -q $LOCALTONET_URL -O /tmp/localtonet.zip
unzip -o /tmp/localtonet.zip -d /tmp/

echo "Instalando binario en $INSTALL_DIR..."
mv /tmp/localtonet $INSTALL_DIR/
chmod +x $INSTALL_DIR/localtonet

# Crear archivo de configuración
if [ ! -f "$CONFIG_DIR/config.env" ]; then
    echo "Creando archivo de configuración..."
    cat <<EOL > $CONFIG_DIR/config.env
AUTH_TOKEN=tu_token_aqui
TUNNELS="127.0.0.1:8080"
EOL
    chmod 600 $CONFIG_DIR/config.env
else
    echo "Archivo de configuración ya existe en $CONFIG_DIR/config.env"
fi

# Crear servicio systemd
echo "Configurando servicio systemd..."
cat <<EOL > $SERVICE_FILE
[Unit]
Description=Localtonet Tunnel Service
After=network.target

[Service]
Type=simple
EnvironmentFile=$CONFIG_DIR/config.env
ExecStart=$INSTALL_DIR/localtonet authtoken \$AUTH_TOKEN \$TUNNELS
Restart=always

[Install]
WantedBy=multi-user.target
EOL

# Recargar systemd y habilitar el servicio
echo "Habilitando servicio Localtonet..."
systemctl daemon-reload
systemctl enable localtonet

echo "=== Instalación completada con éxito ==="
echo "1. Edita el archivo de configuración para agregar tu token y puertos:"
echo "   sudo nano $CONFIG_DIR/config.env"
echo "2. Inicia el servicio con:"
echo "   sudo systemctl start localtonet"
echo "3. Verifica el estado del servicio con:"
echo "   sudo systemctl status localtonet"
