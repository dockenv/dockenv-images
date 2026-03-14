FROM ghcr.io/dani-garcia/vaultwarden:latest

ENV ROCKET_PROFILE="release" \
    ROCKET_ADDRESS=0.0.0.0 \
    ROCKET_PORT=80 \
    SSL_CERT_DIR=/etc/ssl/certs

VOLUME /data
EXPOSE 80

HEALTHCHECK --interval=60s --timeout=10s CMD ["/healthcheck.sh"]

CMD ["/start.sh"]