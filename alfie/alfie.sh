#!/bin/bash

echo "----- TABLA ALFREDO 2.1 -----"

echo "Creando esquema y tabla particionada..."
psql -d rita -f alfie_table.sql

echo "Insertando datos a la base..."
parallel -j+0 --eta 'psql -f alfie_insert.sql -d rita -v v1={}' ::: $(seq 1987 2008)

echo "Aspirando y analizando..."
cat alfie_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'

echo "Creando índices..."
cat alfie_ix.sql | parallel -j+0 --eta psql -d rita -c '{}'

echo "Aspirando y analizando..."
cat alfie_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'

paplay /usr/share/sounds/KDE-Im-User-Auth.ogg