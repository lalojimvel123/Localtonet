FROM alpine:latest

# Instala las herramientas necesarias
RUN apk add --no-cache bash wget unzip

# Crea el directorio app si no existe
RUN mkdir -p /app

# Descarga y extrae Localtonet
WORKDIR /app
RUN wget -O localtonet-linux-arm64.zip "https://localtonet.com/download/localtonet-linux-arm64.zip" && \
    unzip localtonet-linux-arm64.zip && \
    rm localtonet-linux-arm64.zip

# Asegúrate de que localtonet es ejecutable
RUN chmod +x /app/localtonet

# Establece el directorio de trabajo
WORKDIR /app

# Ejecuta localtonet al iniciar el contenedor, pasando el token
CMD ["sh", "-c", "echo \"$LOCALTO_TOKEN\" | ./localtonet"]
