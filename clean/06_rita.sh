
# Lanzamos la limpieza de manera secuencial
echo "$(tput setaf 1)Cambiando de formato los datos y guardando en el esquema 'clean'...$(tput sgr0)"
psql -d rita -U kaelinho -f ./datos/limpia_rita.sql


