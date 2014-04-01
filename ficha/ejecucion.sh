#!/bin/bash

psql -d rita -f ficha.sql

cont=$(echo $1 | egrep -o ',' | wc -l)
echo "$cont"

rm aux
touch aux

if (("$cont" > 0)); then
	for year in {1987..2008}; do
		echo "psql -f ficha_aerolinea.sql -d rita -v v1=\"'$1'\" -v v2=$year" >> aux
	done
	parallel -j +0 --eta -a aux
else
	for year in {1987..2008}; do
		echo "psql -f ficha_fuzzy.sql -d rita -v v1=\"'$1'\" -v v2=$year" >> aux
	done
	parallel -j +0 --eta -a aux
fi

psql -d rita -c 'select * from ficha;'

psql -d rita -c "\copy ficha to '/home/kaelinho/Desktop/Tarea 6/queries/ficha.csv' csv header"