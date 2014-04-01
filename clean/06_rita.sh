#!/bin/bash

date

echo "$(tput setaf 1)----- TABLA RITA LIMPIA -----$(tput sgr0)"

echo "$(tput setaf 1)Creando catálogos externos...$(tput sgr0)"
psql -d rita -f ./clean/foreign_tables.sql
date

echo "$(tput setaf 1)Creando tablas...$(tput sgr0)"
psql -d rita -f ./clean/rita_table.sql
psql -d rita -f ./clean/paso_table.sql
psql -d rita -f ./clean/dvsd_table.sql
date

echo "$(tput setaf 1)Dando formato y limpiando datos...$(tput sgr0)"
parallel -j+0 --eta 'psql -f ./clean/rita_insert.sql -d rita -v v1={}' ::: $(seq 1987 2008)
date

echo "$(tput setaf 1)Creando índices...$(tput sgr0)"
cat ./clean/rita_ix.sql | parallel -j+0 --eta psql -d rita -c '{}'
date

echo "$(tput setaf 1)Aspirando y analizando...$(tput sgr0)"
cat ./clean/rita_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'
date

echo "$(tput setaf 1)Llenando tablas de paso...$(tput sgr0)"
parallel -j+0 --eta 'psql -f ./clean/paso_insert.sql -d rita -v v1={}' ::: $(seq 1987 2008)
cat ./clean/paso_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'
date

parallel -j +0 --eta 'psql -f ./clean/dvsd.sql -d rita -v v1={}' ::: $(seq 1987 2008)
psql -d rita -c "\copy clean.dist_vs_delay to './dvsd.out' csv header"
date

mailx -s "Rita limpia y con formato." < /dev/null "kaelhuerta@gmail.com"