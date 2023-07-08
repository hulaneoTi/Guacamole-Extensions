#!/bin/sh
#
# check if docker is running
if ! (docker ps >/dev/null 2>&1)
then
	echo "docker daemon is not running, install stop here!"
	exit
fi
mkdir ./init >/dev/null 2>&1
mkdir -p ./nginx/ssl >/dev/null 2>&1
mkdir ./guacamole
chmod -R +x ./guacamole
chmod -R +x ./init
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > ./init/initdb.sql
echo "Ready"
echo "Creating SSL Certificates"
openssl req -nodes -newkey rsa:2048 -new -x509 -keyout nginx/ssl/self-ssl.key -out nginx/ssl/self.cert -subj '/C=DE/ST=BY/L=Hintertupfing/O=Dorfwirt/OU=Theke/CN=www.createyourown.domain/emailAddress=docker@createyourown.domain'
echo "Você pode usar seus próprios certificados colocando a chave privada em  nginx/ssl/self-ssl.key e o certificado em nginx/ssl/self.cert"
echo "done"
