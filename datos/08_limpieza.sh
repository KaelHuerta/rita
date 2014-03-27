#!/bin/bash

echo "$(tput setaf 1)$(tput setaf 1)Graficando resultados...$(tput sgr0)"
Rscript histogramas.R --slave

# Preguntamos al usuario si desea eliminar todos los archivos intermedios
echo "$(tput setaf 1)¿Deseas eliminar todos los archivos intermedios?$(tput sgr0)"
echo "$(tput setaf 1)Sólo se guardarán:$(tput sgr0)"
echo "$(tput setaf 1)- El objeto big.matrix de R$(tput sgr0)"
echo "$(tput setaf 1)- La tabla de resultados.$(tput sgr0)"
echo "$(tput setaf 1)- La base de datos en sqlite$(tput sgr0)"
echo "$(tput setaf 1)Elige el número de la opción deseada.$(tput sgr0)"
select respuesta in Si No
do
  if [ "$respuesta" = "Si" ]
    then
  	  echo "$(tput setaf 1)Eliminando los archivos comprimidos$(tput sgr0)"
  	  rm *.bz2
  	  echo "$(tput setaf 1)Eliminando los archivos descomprimidos$(tput sgr0)"
  	  rm utf8*.csv
  	  echo "$(tput setaf 1)Eliminando los archivos .psv$(tput sgr0)"
  	  rm *.psv
  	  echo "$(tput setaf 1)Eliminando catálogos$(tput sgr0)"
  	  rm *.cat

  	  break
  fi
  if [ "$respuesta" = "No" ]
  	then
  	  echo "$(tput setaf 1)No se ha borrado ningún archivo.$(tput sgr0)"
  	  break;
  fi
done

paplay /usr/share/sounds/KDE-Im-User-Auth.ogg