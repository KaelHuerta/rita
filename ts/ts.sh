#!/bin/bash

date

echo "----- TABLA SERIE DE TIEMPO -----"

echo "$(tput setaf 1)Creando tablas...$(tput sgr0)"
psql -d rita -f ./ts/ts_table.sql

echo "$(tput setaf 1)Insertando datos a la serie de tiempo...$(tput sgr0)"
parallel -j+0 --eta 'psql -f ./ts/ts_insert.sql -d rita -v v1={}' ::: $(seq 1987 2008)

echo "$(tput setaf 1)Creando índices...$(tput sgr0)"
cat ts_ix.sql | parallel -j+0 --eta psql -d rita -c '{}'

echo "$(tput setaf 1)Aspirando y analizando...$(tput sgr0)"
cat ./ts/ts_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'

mailx -s "Tabla serie de tiempo lista." < /dev/null "kaelhuerta@gmail.com"

date