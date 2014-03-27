#!/bin/bash

#echo "$(tput setaf 1)$(tput setaf 1)Graficando resultados...$(tput sgr0)"
#Rscript histogramas.R --slave

# Preguntamos al usuario si desea eliminar todos los archivos intermedios
echo "$(tput setaf 1)¿Deseas eliminar lo siguiente?$(tput sgr0)"
echo "$(tput setaf 1)- La base en el esquema dirty.$(tput sgr0)"
echo "$(tput setaf 1)- Los archivos divididos, .csv y .bz2.$(tput sgr0)"
echo "$(tput setaf 1)Elige el número de la opción deseada.$(tput sgr0)"
select respuesta in Si No
do
  if [ "$respuesta" = "Si" ]
    then
  	  echo "$(tput setaf 1)Eliminando los archivos comprimidos...$(tput sgr0)"
  	  rm *.bz2
  	  echo "$(tput setaf 1)Eliminando los archivos descomprimidos...$(tput sgr0)"
  	  rm utf8*.csv
  	  echo "$(tput setaf 1)Ignorando los catálogos...$(tput sgr0)"
  	  echo "$(tput setaf 1)Eliminando el esquema dirty...$(tput sgr0)"
  	  psql -d rita -c 'drop table dirty.rita;'
  	  break
  fi
  if [ "$respuesta" = "No" ]
  	then
  	  echo "$(tput setaf 1)No se ha borrado ningún archivo.$(tput sgr0)"
  	  break;
  fi
done

#paplay /usr/share/sounds/KDE-Im-User-Auth.ogg
mailx -s "Limpieza completada." < /dev/null "kaelhuerta@gmail.com"