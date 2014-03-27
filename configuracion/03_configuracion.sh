#!/bin/bash

echo "$(tput setaf 1)Cambiando la configuración del servidor...$(tput sgr0)"
# Verifico que no exista el respaldo
[ ! -f /etc/postgresql/9.3/main/postgresql.conf.old ] &&
cp /etc/postgresql/9.3/main/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf.old

# Sobreescribo el archivo de configuración
cp ./mi_postgresql.conf /etc/postgresql/9.3/main/postgresql.conf

echo "$(tput setaf 1)Cambiando el tamaño de la página virtual...$(tput sgr0)"
# Cambio el tamaño de paginación
./paginacion.sh

# Reinicio el servido para que tomen efecto los cambios
sudo service postgresql restart

# Creamos el directorio (aunque de juguete) donde se va a crear el "tablespace"
[ -d /data/rita ] && rm -r /data/rita
mkdir /data/rita

chown postgres /data/rita
