#!/bin/bash

echo "----- TABLA SERIE DE TIEMPO -----"

echo "Creando esquema y tabla particionada..."
psql -d rita -f ts_table.sql

echo "Insertando datos a la base..."
parallel -j+0 --eta 'psql -f ts_insert.sql -d rita -v v1={}' ::: $(seq 1987 2008)

echo "Aspirando y analizando..."
#cat ts_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'

echo "Creando índices..."
#cat ts_ix.sql | parallel -j+0 --eta psql -d rita -c '{}'

echo "Aspirando y analizando..."
cat ts_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'

#paplay /usr/share/sounds/KDE-Im-User-Auth.ogg
mailx -s "Tabla serie de tiempo lista." < /dev/null "kaelhuerta@gmail.com"