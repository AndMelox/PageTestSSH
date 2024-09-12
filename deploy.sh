#!/bin/bash

# Directorio donde se clonará el repositorio
DEPLOY_DIR="/var/www/html/site"

REPO_URL="https://github.com/AndMelox/PageTestSSH.git"

if [ -d "$DEPLOY_DIR" ]; then
    echo "Actualizando el repositorio en $DEPLOY_DIR..."
    cd "$DEPLOY_DIR"
    git pull origin main
else
    echo "Clonando el repositorio desde $REPO_URL a $DEPLOY_DIR..."
    git clone "$REPO_URL" "$DEPLOY_DIR"
fi

# Configuración del servidor web
echo "Reiniciando el servidor web Apache..."
sudo systemctl restart apache2
