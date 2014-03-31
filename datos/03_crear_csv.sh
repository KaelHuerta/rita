#!/bin/bash

echo "$(tput setaf 1)Descomprimiendo archivos y cambiando de formato...$(tput sgr0)"

# Si ya existen los eliminamos
[ -f utf8_1987.csv ] && rm ./datos/utf8_*

# Para descomprimir y convertir a utf8 en paralelo
date
ls *.bz2 | parallel -j +0 --eta 'bzcat {} | iconv -f ISO-8859-1 -t UTF-8 |
	sed 1d > ./datos/utf8_{.}'
date

# Dividimos los archivos
echo "$(tput setaf 1)Dividiendo los archivos...$(tput sgr0)"
ls ./datos/utf8_* | parallel -j +0 --eta 'split -a 2 -d -l 1000000 {} ./datos/s_{.}_'
date

#wc -l utf8_*
# 123,534,969 total
#wc -l s_utf8_*
# 123,534,969 total

mailx -s "Rita descomprimida y dividida." < /dev/null "kaelhuerta@gmail.com"