nombre de la imagen
```bash
localtonet/localto_app
```
contenido de la imagen ubuntu:20.04
```bash
FROM ubuntu:20.04

# Instala las herramientas necesarias
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Crea el directorio app si no existe
RUN mkdir -p /app

# Descarga y extrae Localtonet para Linux x64
WORKDIR /app
RUN wget -O localtonet-linux-x64.zip "https://localtonet.com/download/localtonet-linux-x64.zip" && \
    unzip localtonet-linux-x64.zip && \
    rm localtonet-linux-x64.zip

# Asegúrate de que localtonet es ejecutable
RUN chmod +x /app/localtonet

# Establece el directorio de trabajo
WORKDIR /app

# Ejecuta localtonet al iniciar el contenedor, pasando el token
CMD ["sh", "-c", "./localtonet $LOCALTO_TOKEN"]

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
