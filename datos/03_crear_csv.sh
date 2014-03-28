#!/bin/bash

# Para descomprimir en paralelo
#ls *.bz2 | parallel -j +0 --eta 'bzcat {} > {.}'

echo "$(tput setaf 1)Descomprimiendo archivos y cambiando de formato...$(tput sgr0)"

# Si ya existen los eliminamos
[ -f utf8_1987.csv ] && rm ./datos/utf8_*

# Para descomprimir y convertir a utf8 en paralelo
date
ls *.bz2 | parallel -j +0 --eta 'bzcat {} | iconv -f ISO-8859-1 -t UTF-8 |
	sed 1d > ./datos/utf8_{.}'
date
#ls *.bz2 | parallel -j +0 --eta 'bzcat {} | iconv -t UTF-8 > utf8_{.}'

#ls utf8_* | parallel -j +0 --dryrun --tmpdir ./ --eta 'split -l 1000000 {}'

# Dividimos los archivos
echo "$(tput setaf 1)Dividiendo los archivos...$(tput sgr0)"
ls utf8_* | parallel -j +0 --eta 'split -a 2 -d -l 1000000 {} ./datos/s_{.}_'
date
# Unimos los archivos de manera secuencial para evitar colisiones
#echo "$(tput setaf 1)Uniendo archivos en uno sólo...$(tput sgr0)"
#head -n 1 utf8_1989.csv > rita.csv
#for f in utf8*.csv
#do
#  sed 1d "$f" | awk 'BEGIN{FS=","} {if($11 !~ "NA") print $0}' >> rita.csv
#done

#paplay /usr/share/sounds/KDE-Im-User-Auth.ogg

#wc -l utf8_*
# 123,534,969 total
#wc -l s_utf8_*
# 123,534,969 total

mailx -s "Rita descomprimida y dividida." < /dev/null "kaelhuerta@gmail.com"