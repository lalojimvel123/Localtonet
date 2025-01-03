nombre de la imagen
```bash
localtonet/localto_app
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

# Descargar el script `start.sh` desde GitHub
RUN wget -O /app/start_ubuntu.sh "[https://raw.githubusercontent.com/lalojimvel123/Localtonet/refs/heads/main/install_docker/start.sh](https://raw.githubusercontent.com/lalojimvel123/Localtonet/refs/heads/main/install_docker/start_ubuntu.sh)" && \
    chmod +x /app/start_ubuntu.sh

# Establecer el script como punto de entrada
CMD ["/app/start_ubuntu.sh"]

```

contenido de la imagen alpine
```bash
    FROM alpine:latest
    
    # Instala las herramientas necesarias
    RUN apk add --no-cache bash wget unzip
    
    # Crea el directorio app si no existe
    RUN mkdir -p /app
    
    # Descarga y extrae Localtonet para Alpine Linux (musl 64)
    WORKDIR /app
    RUN wget -O localtonet-linux-musl-x64.zip "https://localtonet.com/download/localtonet-linux-musl-x64.zip" && \
        unzip localtonet-linux-musl-x64.zip && \
        rm localtonet-linux-musl-x64.zip
    
    # Asegúrate de que localtonet es ejecutable
    RUN chmod +x /app/localtonet
    
    # Establece el directorio de trabajo
    WORKDIR /app
    
    # Ejecuta localtonet al iniciar el contenedor, pasando el token
    CMD ["sh", "-c", "./localtonet $LOCALTO_TOKEN"]
```
