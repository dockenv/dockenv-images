FROM rabbitmq:alpine

LABEL org.opencontainers.image.title="Rabbitmq" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='Rabbitmq latest'

RUN rabbitmq-plugins enable --offline rabbitmq_management

VOLUME [ "/var/lib/rabbitmq" ]

EXPOSE 4369 5671 5672 15691 15692 25672
CMD ["rabbitmq-server"]
