FROM mcr.microsoft.com/mssql/server:2019-latest

LABEL MAINTAINER="Cloudflying" \
    MAIL="<oss@live.hk>" \
    org.opencontainers.image.source=https://github.com/dockenv/dockenv-images\
    org.opencontainers.image.description='Microsoft SQL Server 2019'

ENV ACCEPT_EULA=Y
VOLUME /var/opt/mssql

EXPOSE 1433
CMD /opt/mssql/bin/sqlservr
