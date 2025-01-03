nombre de la imagen
```bash
localtonet/localto_app
```
contenido de la imagen
```bash
    FROM alpine:latest
    
    # Instala las herramientas necesarias
    RUN apk add --no-cache bash wget unzip
    
    # Crea el directorio app si no existe
    RUN mkdir -p /app
    
    # Descarga y extrae Localtonet para Alpine Linux (musl 64)
    WORKDIR /app
    RUN wget -O localtonet-alpine-musl64.zip "https://localtonet.com/download/localtonet-linux-musl-x64.zip" && \
        unzip localtonet-linux-musl-x64.zip && \
        rm localtonet-linux-musl-x64.zip
    
    # Asegúrate de que localtonet es ejecutable
    RUN chmod +x /app/localtonet
    
    # Establece el directorio de trabajo
    WORKDIR /app
    
    # Ejecuta localtonet al iniciar el contenedor, pasando el token
    CMD ["sh", "-c", "./localtonet $LOCALTO_TOKEN"]
```
