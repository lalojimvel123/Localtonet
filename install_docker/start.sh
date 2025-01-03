#!/bin/bash

# Verificar si el token está definido
if [ -z "$LOCALTO_TOKEN" ]; then
  echo "Error: LOCALTO_TOKEN no está definido."
  exit 1
fi

# Pasar el token automáticamente al programa
echo "$LOCALTO_TOKEN" | ./localtonet

# Mantener el contenedor activo en caso de que localtonet termine
tail -f /dev/null
