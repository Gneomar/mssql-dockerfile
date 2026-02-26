#!/bin/bash

# Iniciar SQL Server en segundo plano
/opt/mssql/bin/sqlservr &

# Esperar a que SQL Server esté listo
sleep 20s

# Ejecutar el script SQL de inicialización
#/opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P StrongP@ssw0rd123 -i /init-scripts/init-db.sql -C
/opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P ${SA_PASSWORD} -i /init-scripts/init-db.sql -C


# Mantener el contenedor activo
wait
