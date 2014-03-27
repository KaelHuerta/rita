#!/bin/bash

# Para revisar si un archivo existe o no
[ -f rita.urls ] && rm rita.urls

# Generamos archivo sobre el cual iterar en paralelo
for year in {1987..2008}
do
echo "http://stat-computing.org/dataexpo/2009/$year.csv.bz2" >> rita.urls
done

# Preguntamos al usuario si desea descargar o generar los catálogos
echo "$(tput setaf 1)¿Deseas utilizar los catálogos limpios, aunque escasos, de la página?$(tput sgr0)"
echo "$(tput setaf 1)Elige el número de la opción deseada.$(tput sgr0)"
select respuesta in Si No
do
  if [ "$respuesta" = "Si" ]
    then
  	  echo "$(tput setaf 1)Descargando los catálogos...$(tput sgr0)"
  	  echo "http://stat-computing.org/dataexpo/2009/airports.csv" >> rita.urls
	  echo "http://stat-computing.org/dataexpo/2009/plane-data.csv" >> rita.urls
	  echo "http://stat-computing.org/dataexpo/2009/carriers.csv" >> rita.urls
  	  break
  fi
  if [ "$respuesta" = "No" ]
  	then
  	  echo "$(tput setaf 1)Los catálogos serán generados...$(tput sgr0)"
  	  break;
  fi
done

# Descargamos en paralelo
cat rita.urls | parallel curl -O

rm rita.urls

#paplay /usr/share/sounds/KDE-Im-User-Auth.ogg