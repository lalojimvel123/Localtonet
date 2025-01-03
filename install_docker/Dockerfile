FROM alpine:latest

# Instala las herramientas necesarias para descargar y ejecutar el script
RUN apk add --no-cache bash wget

# Descarga el script desde GitHub
RUN wget -O /app/localto.sh "https://raw.githubusercontent.com/usuario/repositorio/master/path/to/localto.sh"

# Asegúrate de que el script es ejecutable
RUN chmod +x /app/localto.sh

# Establece el directorio de trabajo
WORKDIR /app

# Ejecuta el script al iniciar el contenedor
CMD ["sh", "-c", "echo \"$LOCALTO_TOKEN\" | ./localto.sh"]
