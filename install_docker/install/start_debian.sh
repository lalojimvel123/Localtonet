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
  # Ejecutar localtonet usando `expect`
  echo "Ejecutando LocalToNet..."
  expect -c "
    spawn /app/localtonet
    expect \"Please enter your token:\"
    send \"$LOCALTO_TOKEN\r\"
    interact
  "

  # Si localtonet termina por alguna razón, reiniciamos el programa
  echo "LocalToNet terminó, reiniciando..."
  sleep 3  # Esperamos 3 segundos antes de reiniciar
done

