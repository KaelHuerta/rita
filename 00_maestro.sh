#!/bin/bash

# Descargamos los archivos
./datos/01_descarga.sh

# Descomprimimos, cambiamos "encoding" y dividimos
./datos/02_crear_csv.sh

# Cambiamos la configuración del postgres
./configuracion/03_configuracion.sh

# 