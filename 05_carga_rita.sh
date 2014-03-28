#!/bin/bash


psql -f ./dirty/rita_table.sql -d rita
# Insertando registros
echo "----- TABLA SUCIA RITA -----"

echo "$(tput setaf 1)Creando tabla...$(tput sgr0)"
psql -d rita -f ./dirty/rita_table.sql

echo "$(tput setaf 1)Insertando datos a la base de datos...$(tput sgr0)"

# Generamod el archivo de "queries"
[ -f ./datos/archivos.txt ] && rm ./datos/archivos.txt
#for f in ./archivos/*
for f in ./datos/s_*
do
	echo "\copy dirty.rita from $f with csv;" >> ./datos/archivos.txt
done

# Lanzamos los "queries" en paralelo
date
parallel -j +0 --eta -a ./datos/archivos.txt 'psql -d rita -U kaelinho -c {}'
date

rm ./datos/archivos.txt


echo "$(tput setaf 1)Creando índices...$(tput sgr0)"
cat ./dirty/rita_ix.sql | parallel -j+0 --eta psql -d rita -c '{}'

echo "$(tput setaf 1)Aspirando y analizando...$(tput sgr0)"
cat ./dirty/rita_vacuum.sql | parallel -j+0 --eta psql -d rita -c '{}'

date

#paplay /usr/share/sounds/KDE-Im-User-Auth.ogg
mailx -s "Rita cargada en sucio." < /dev/null "kaelhuerta@gmail.com"