# Usa la imagen oficial de SQL Server como base
FROM mcr.microsoft.com/mssql/server:2022-latest

# Cambiar a usuario root para instalar paquetes y configurar
USER root

# Copiar scripts al contenedor
COPY init-scripts /init-scripts

# Convertir scripts al formato Unix dentro del contenedor
RUN apt-get update && apt-get install -y dos2unix && \
    dos2unix /init-scripts/init-db.sh && \
    chmod +x /init-scripts/init-db.sh

# Exponer los puertos necesarios
EXPOSE 1433

# Comando predeterminado al iniciar el contenedor
CMD ["/bin/bash", "/init-scripts/init-db.sh"]
