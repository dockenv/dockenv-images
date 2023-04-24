FROM aerospike:ce-6.3.0.1_1
LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk" \
        org.opencontainers.image.source=https://github.com/dockenv/dockenv

# COPY aerospike.conf /etc/aerospike/aerospike.conf

EXPOSE 3000 3001 3002

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/entrypoint.sh"]

CMD ["asd"]
