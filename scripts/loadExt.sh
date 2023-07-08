#!/bin/bash

# Diretório de origem
diretorio="/opt/guacamole/extension"

# Percorre todos os arquivos no diretório
for arquivo in "$diretorio"/*; do
    if [ -d "$arquivo" ]; then
        # Se for um diretório, compacta usando o comando zip
        nome_arquivo="$(basename "$arquivo")"
		jar cf "$diretorio/$nome_arquivo.jar" -C "$arquivo" .
    fi
done

# Cria links simbólicos para todos os arquivos .jar
for arquivo in "$diretorio"/*.jar; do
    if [ -f "$arquivo" ]; then
        # Se for um arquivo .jar, cria o link simbólico
        nome_link="$(basename "$arquivo").link"
        ln -s "$arquivo" "$1"
    fi
done

#ln -s /opt/guacamole/extension/tisafe.jar "$1"