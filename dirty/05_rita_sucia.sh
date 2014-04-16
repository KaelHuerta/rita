#!/bin/bash

date

echo "$(tput setaf 1)----- TABLA SUCIA RITA -----$(tput sgr0)"

echo "$(tput setaf 1)Creando tabla...$(tput sgr0)"
psql -d rita -f ./dirty/rita_table.sql
date

echo "$(tput setaf 1)Insertando datos a la base...$(tput sgr0)"
[ -f ./datos/archivos.txt ] && rm ./datos/archivos.txt
for f in ./datos/s_*
do
	echo "\copy dirty.rita from $f with csv;" >> ./datos/archivos.txt
done
parallel -j +0 --eta -a ./datos/archivos.txt 'psql -d rita -U kaelinho -c {}'
rm ./datos/archivos.txt
date

echo "$(tput setaf 1)Creando índice...$(tput sgr0)"
psql -d rita -c "CREATE INDEX ix_rita_date ON dirty.rita ((year || '-' || month || '-' || dayofmonth));"
date

echo "$(tput setaf 1)Aspirando y analizando...$(tput sgr0)"
psql -d rita -c 'vacuum analyze dirty.rita;'
date

mailx -s "Rita cargada en sucio." < /dev/null "correo@gmail.com"
