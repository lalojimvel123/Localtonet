nombre de la imagen para ubuntu
```bash
localtonet/localto_app:ubuntu
```
contenido de la imagen ubuntu:20.04
```bash
FROM ubuntu:20.04

# Instalar herramientas necesarias
RUN apt-get update && apt-get install -y wget unzip expect libc6 libstdc++6 libgcc1 libicu-dev libssl-dev libkrb5-3 zlib1g && \
    rm -rf /var/lib/apt/lists/*

# Crear el directorio app
RUN mkdir -p /app

# Descargar y extraer Localtonet
WORKDIR /app
RUN wget -O localtonet-linux-x64.zip "https://localtonet.com/download/localtonet-linux-x64.zip" && \
    unzip localtonet-linux-x64.zip && \
    rm localtonet-linux-x64.zip

# Asegurarse de que localtonet es ejecutable
RUN chmod +x /app/localtonet

# Descargar el script `start_ubuntu.sh` desde GitHub
RUN wget -O /app/start_ubuntu.sh "https://raw.githubusercontent.com/lalojimvel123/Localtonet/refs/heads/main/install_docker/start_ubuntu.sh" && \
    chmod +x /app/start_ubuntu.sh

# Establecer el script como punto de entrada
CMD ["/app/start_ubuntu.sh"]

```
nombre de la imagen para debian slim
```bash
localtonet/localto_app:debian_slim
```
contenido de la imagen debian_slim
```bash
FROM alpine:latest

# Instalar dependencias necesarias
RUN apk add --no-cache bash wget unzip libc6-compat expect

# Crear el directorio de trabajo
WORKDIR /app

# Descargar y extraer Localtonet (versión Alpine Linux)
RUN wget -O localtonet-linux-musl-x64.zip "https://localtonet.com/download/localtonet-linux-musl-x64.zip" && \
    unzip localtonet-linux-musl-x64.zip && \
    rm localtonet-linux-musl-x64.zip

# Asegurar que Localtonet sea ejecutable
RUN chmod +x /app/localtonet

# Descargar el script `start_alpine.sh` desde GitHub
RUN wget -O /app/start_alpine.sh "https://raw.githubusercontent.com/lalojimvel123/Localtonet/refs/heads/main/install_docker/start_alpine.sh" && \
    chmod +x /app/start_alpine.sh

# Establecer el script como punto de entrada
CMD ["/app/start_alpine.sh"]

```
