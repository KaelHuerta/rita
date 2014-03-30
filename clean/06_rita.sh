#!/bin/bash

date

echo "----- TABLA RITA LIMPIA -----"

echo "$(tput setaf 1)Creando catálogos externos...$(tput sgr0)"
psql -d rita -f ./clean/foreign_tables.sql
date

echo "$(tput setaf 1)Creando tablas...$(tput sgr0)"
psql -d rita -f ./clean/rita_table.sql
date

echo "$(tput setaf 1)Dando formato y limpiando datos...$(tput sgr0)"
parallel -j+0 --eta 'psql -f ./clean/rita_insert.sql -d rita -v v1={}' ::: $(seq 1987 2008)
date

echo "$(tput setaf 1)Creando índices...$(tput sgr0)"
#cat ts_ix.sql | parallel -j+0 --eta psql -d rita -c '{}'
date

echo "$(tput setaf 1)Aspirando y analizando...$(tput sgr0)"
cat ./clean/rita_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'
date

mailx -s "Rita limpia y con formato." < /dev/null "kaelhuerta@gmail.com"