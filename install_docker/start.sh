#!/usr/bin/expect

set timeout -1

# Verificar si el token está definido
if {![info exists env(LOCALTO_TOKEN)]} {
    send_user "Error: LOCALTO_TOKEN no está definido.\n"
    exit 1
}

# Ejecutar localtonet
spawn /app/localtonet

# Esperar a que el programa solicite el token
expect "Please enter your token:"

# Enviar el token
send "$env(LOCALTO_TOKEN)\r"

# Mantener el contenedor activo en caso de que localtonet termine
interact
