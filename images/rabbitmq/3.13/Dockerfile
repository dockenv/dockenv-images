FROM rabbitmq:3.13-alpine

LABEL org.opencontainers.image.title="Rabbitmq" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='Rabbitmq latest'

RUN rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_mqtt rabbitmq_federation_management rabbitmq_stomp

VOLUME [ "/var/lib/rabbitmq" ]

ENTRYPOINT ["docker-entrypoint.sh"]

# MQTT 1883, MQTT Web 15692, Stomp 61613, RabbitMQ 5672， RabbitMQ Management Web 15672
EXPOSE 1883 4369 5671 5672 15691 15692 25672
CMD ["rabbitmq-server"]
