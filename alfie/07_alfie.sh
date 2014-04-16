#!/bin/bash

echo "$(tput setaf 1)----- TABLA ALFREDO 2.1 -----$(tput sgr0)"

echo "$(tput setaf 1)Creando esquema y tablas...$(tput sgr0)"
psql -d rita -f ./alfie/alfie_table.sql
psql -d rita -f ./alfie/dest_table.sql

echo "$(tput setaf 1)Creando tabla intermedia...$(tput sgr0)"
parallel -j+0 --eta 'psql -f ./alfie/dest_insert.sql -d rita -v v1={}' ::: $(seq 1987 2008)
psql -d rita -c 'vacuum analyze alfie.destinations;'

echo "$(tput setaf 1)Insertando datos a Alf's Mix...$(tput sgr0)"
parallel -j+0 --eta 'psql -f ./alfie/alfie_insert.sql -d rita -v v1={}' ::: $(seq 1987 2008)

echo "$(tput setaf 1)Aspirando y analizando...$(tput sgr0)"
cat ./alfie/alfie_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'

echo "$(tput setaf 1)Creando índices...$(tput sgr0)"
cat ./alfie/alfie_ix.sql | parallel -j+0 --eta psql -d rita -c '{}'

echo "$(tput setaf 1)Aspirando y analizando...$(tput sgr0)"
cat ./alfie/alfie_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'

mailx -s "Tabla Al's mix lista." < /dev/null "correo@gmail.com"
