#!/bin/bash

# Si ya existe la base datos, bórrala y crea una nueva
echo "$(tput setaf 1)Creando base de datos, esquemas y tablas...$(tput sgr0)"
if [ $(psql -l | grep "rita" | wc -l) = 1 ]
then
  dropdb rita
  createdb rita
else
  createdb rita
fi

psql -f tablas.sql -d rita
psql -f particiones.sql -d rita