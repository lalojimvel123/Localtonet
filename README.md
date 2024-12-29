# Localtonet
Localtonet en una Raspberry Pi o cualquier sistema basado en Linux con arquitectura ARM64. Además, estructuraremos todo como un script ejecutable que podrás subir a GitHub. Este script configurará automáticamente Localtonet, permitirá modificar el token de autorización y habilitará la configuración de varios puertos.


# Linux-System-Scripts
"Scripts para actualizar sistema, montar discos NTFS y configurar OpenMediaVault"


1. asegurate de tener instalado git:
   
   ```bash
   sudo apt install git
   ```
   
2. Ejecutar para Raspberry Pi o cualquier máquina Linux:
   
   ```bash
   #wget -O - https://raw.githubusercontent.com/lalojimvel123/Localtonet/refs/heads/main/install.sh | sudo bash
   git clone https://github.com/lalojimvel123/Localtonet.git
   cd ./Localtonet/
   bash main.sh
   ```
