Nombre del contenedor
```bash
localto_app
```
configuracion de contenedor
````
version: "3.8"  # Especifica la versión de Compose

services:
  localto_app:
    image: localtonet/localto_app:latest  # Imagen de tu contenedor
    networks:
      - mi-red-localto
    environment:
      - LOCALTO_TOKEN=dfLK0tRiWh5H4SewyXN9oFT1runZDk8zB  # Token de Localtonet
    restart: unless-stopped  # Reinicia automáticamente si falla
    stdin_open: true  # Mantiene la entrada estándar abierta
    tty: true          # Emula un terminal para evitar problemas con TTY

networks:
  mi-red-localto:
    external: false  # Crea una red interna para los servicios

````
external: true
Significado: Cuando especificas external: true para una red en Docker Compose, estás indicando que la red ya existe en el sistema Docker y no debe ser creada por Docker Compose. La red debe estar previamente creada fuera de esta configuración, ya sea manualmente mediante el comando docker network create o por otro servicio o configuración.
Uso: Es útil cuando:
Quieres conectar tus servicios a una red que ya está configurada y usada por otros servicios o contenedores fuera del contexto de este stack.
Necesitas integrar tu stack con una red existente que puede ser parte de una infraestructura más grande o de un entorno de Docker Swarm.

  external: false
Significado: Al usar external: false o simplemente omitirlo (ya que false es el valor por defecto), Docker Compose creará la red automáticamente si no existe, como parte del proceso de desplegar el stack. Esto es lo más común cuando defines redes dentro de tu archivo de composición.
Uso: Es apropiado cuando:
Estás diseñando una aplicación o servicio que tiene toda su infraestructura de red definida dentro del mismo archivo de configuración.
No necesitas integrarte con redes pre-existentes; quieres que Docker Compose maneje todo el ciclo de vida de la red para tus servicios.
