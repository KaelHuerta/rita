#!/bin/bash

echo "$(tput setaf 1)----- Grafo -----$(tput sgr0)"

echo "$(tput setaf 1)Creando esquema y tablas...$(tput sgr0)"
psql -d rita -f ./graph/graph_table.sql

echo "$(tput setaf 1)Creando nodos...$(tput sgr0)"
parallel -j+0 --eta 'psql -f ./graph/ngraphode_insert.sql -d rita -v v1={}' ::: $(seq 1987 2008)

echo "$(tput setaf 1)Creando aristas...$(tput sgr0)"
parallel -j+0 --eta 'psql -f ./graph/edge_insert.sql -d rita -v v1={}' ::: $(seq 1987 2008)

echo "$(tput setaf 1)Aspirando y analizando...$(tput sgr0)"
cat ./graph/graph_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'

echo "$(tput setaf 1)Creando índices...$(tput sgr0)"
cat ./alfie/alfie_ix.sql | parallel -j+0 --eta psql -d rita -c '{}'

echo "$(tput setaf 1)Aspirando y analizando...$(tput sgr0)"
cat ./graph/graph_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'

mailx -s "Tabla Al's mix lista." < /dev/null "correo@gmail.com"
