services:
  localto-app:
    build:
      context: .
      dockerfile: |
        FROM alpine:latest

        # Instala las herramientas necesarias para descargar y ejecutar el script
        RUN apk add --no-cache bash wget

        # Descarga el script desde GitHub
        RUN wget -O /app/localto.sh "https://raw.githubusercontent.com/lalojimvel123/Localtonet/aee4520762222b555649488c5ae4130fc4847476/install_docker/localto_installl.sh"

        # Asegúrate de que el script es ejecutable
        RUN chmod +x /app/localto.sh

        # Establece el directorio de trabajo
        WORKDIR /app

        # Ejecuta el script al iniciar el contenedor
        CMD ["/app/localto.sh"]
    networks:
      - mi-red-localto

networks:
  mi-red-localto:
    external: false
