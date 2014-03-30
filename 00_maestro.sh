#!/bin/bash

echo "$(tput setaf 1)Antes de ejecutar este script debes ejecutar el$(tput sgr0)"
echo "$(tput setaf 1)script ./configuraciones/01_configuracion.sh con$(tput sgr0)"
echo "$(tput setaf 1)derechos de administrador. ¿Deseas continuar?$(tput sgr0)"
select respuesta in Si No
do
  if [ "$respuesta" = "Si" ]
    then
      [ -f log ] && rm log
  	  # Descargamos los archivos
	    #./datos/02_descarga.sh >> log
	    # Descomprimimos, cambiamos "encoding" y dividimos
	    #./datos/03_crear_csv.sh >> log
	    # Creando la base de datos
	    ./datos/04_crea_base_datos.sh >> log
	    # Cargando y limpiando la base de datos
	    ./dirty/05_carga_rita.sh >> log
      # Creando la tabla Alf's Mix
      ./alfie/alfie.sh >> log
      # Creando la serie de tiempo
      ./ts/ts.sh

      echo "$(tput setaf 1)Proceso terminado.$(tput sgr0)"
      break;
  fi
  if [ "$respuesta" = "No" ]
  	then
  	  echo "$(tput setaf 1)Ejecución cancelada.$(tput sgr0)"
  	  break;
  fi
done