FROM alpine:latest

# Instala las herramientas necesarias
RUN apk add --no-cache bash wget

# Crea el directorio app si no existe
RUN mkdir -p /app

# Descarga el script desde GitHub
RUN wget -O /app/localto_installl.sh "https://raw.githubusercontent.com/lalojimvel123/Localtonet/refs/heads/main/install_docker/localto_installl.sh"

# Asegúrate de que el script es ejecutable
RUN chmod +x /app/localto_installl.sh

# Establece el directorio de trabajo
WORKDIR /app

# Ejecuta el script al iniciar el contenedor
CMD ["/app/localto_installl.sh"]

