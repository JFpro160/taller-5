#!/bin/bash

# Actualizar el sistema y paquetes
sudo apt-get update -y
sudo apt-get upgrade -y

# Instalar Node.js 20.x (versión LTS recomendada)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Verificar la instalación de Node.js y npm
node -v
npm -v

# Instalar Serverless Framework de forma global
sudo npm install -g serverless

# Instalar AWS CLI (si no está instalado)
sudo apt-get install -y awscli

# Instalar el plugin de Serverless para Python (permite gestionar dependencias de Python)
serverless plugin install -n serverless-python-requirements

# Instalar Python 3 y pip para instalar boto3
sudo apt-get install -y python3 python3-pip

# Instalar boto3 (librería de AWS para Python)
pip3 install boto3

# Instalar requests (librería para hacer solicitudes HTTP en Python)
pip3 install requests

# Actualizar pip a la última versión
python3 -m pip install --upgrade pip

# Verificar que Serverless Framework se instaló correctamente
serverless -v

echo "¡Atención! Para que tu proyecto funcione correctamente, es necesario que actualices o crees el archivo ~/.aws/credentials. Este lo puedes obtener desde la consola de AWS Academy, dándole al botón 'AWS Details'.
Luego, ejecuta el siguiente comando en tu terminal:
$ serverless deploy"
