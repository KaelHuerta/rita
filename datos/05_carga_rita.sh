#!/bin/bash

# Insertando iterativamente
#for f in s_*
#do
#	echo "$f"
#	sql="\copy dirty.rita from $f with header csv;"
#	echo $sql 
#	echo "-"
#	date
#	psql -d rita -U kaelinho -c "$sql" 
#	echo "*******************************"
#	date 
#done

# Insertando registros
echo "$(tput setaf 1)Insertando datos al esquema 'dirty'...$(tput sgr0)"

# Generamod el archivo de "queries"
[ -f archivos.txt ] && rm archivos.txt
#for f in ./archivos/*
for f in s_*
do
	echo "\copy dirty.rita from $f with csv;" >> archivos.txt
done

# Lanzamos los "queries" en paralelo
#parallel --verbose --dryrun -a archivos.txt 'psql -d rita -U kaelinho -c \"{}\"'
date
#parallel -j +0 --eta -a archivos.txt 'psql -d rita -U kaelinho -c {}'
#parallel -j +0 --eta --results outdir -a archivos.txt 'psql -d rita -U kaelinho -c {}'
date

rm archivos.txt


echo "$(tput setaf 1)Cambiando de formato los datos y guardando en el esquema 'clean'...$(tput sgr0)"

# Lanzamos la limpieza de manera secuencial
psql -d rita -U kaelinho -f limpia_rita.sql
date

#paplay /usr/share/sounds/KDE-Im-User-Auth.ogg
mailx -s "Rita cargada y limpia" < /dev/null "kaelhuerta@gmail.com"