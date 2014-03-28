#!/bin/bash

# Si ya existe la base datos, bórrala y crea una nueva
echo "$(tput setaf 1)Creando base de datos, esquemas, tablas y extensiones...$(tput sgr0)"
if [ $(psql -l | grep "rita" | wc -l) = 1 ]
then
  dropdb rita
  createdb rita
else
  createdb rita
fi

psql -f ./datos/schemas.sql -d rita
psql -f ./datos/rita_table.sql -d rita
