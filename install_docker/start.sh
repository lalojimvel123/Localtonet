#!/usr/bin/expect

# Verificar si el token está definido
if {![info exists env(LOCALTO_TOKEN)]} {
    send_user "Error: LOCALTO_TOKEN no está definido.\n"
    exit 1
}

# Mostrar el token para depuración
send_user "Token recibido: $env(LOCALTO_TOKEN)\n"

# Ejecutar localtonet
spawn /app/localtonet

# Esperar la solicitud de token
expect "Please enter your token:"

# Enviar el token automáticamente
send "$env(LOCALTO_TOKEN)\r"

# Esperar a que localtonet termine (esto puede depender de cómo localtonet termine su ejecución)
expect eof

# Salir correctamente del script
exit 0
