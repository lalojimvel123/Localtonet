#!/bin/bash

# Verificar si el token está definido
if [ -z "$LOCALTO_TOKEN" ]; then
  echo "Error: LOCALTO_TOKEN no está definido."
  exit 1
fi

# Mostrar el token para depuración
echo "Token recibido: $LOCALTO_TOKEN"

# Bucle infinito para ejecutar y reiniciar localtonet
while true; do
  # Ejecutar localtonet
  echo "Ejecutando LocalToNet..."
  /app/localtonet &  # Ejecutar en segundo plano

  # Esperar 3 segundos para que localtonet inicie
  sleep 3

  # Enviar el token usando `expect`
  echo "Enviando el token..."
  expect -c "
    spawn /app/localtonet
    expect \"Please enter your token:\"
    send \"$LOCALTO_TOKEN\r\"
    interact
  "

  # Esperar que localtonet termine
  wait $!

  # Si localtonet termina por alguna razón, reiniciamos el programa
  echo "localtonet terminó, reiniciando..."
  sleep 3  # Esperamos 3 segundos antes de reiniciar el programa
done
