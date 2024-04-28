## Usage
```bash
$ docker run -d \
    --hostname rabbitmq \
    --name rabbitmq \
    -p 15672:15672 \
    -e RABBITMQ_DEFAULT_USER=dockenv \
    -e RABBITMQ_DEFAULT_PASS=dockenv \
    -e RABBITMQ_DEFAULT_VHOST=dockenv \
    ghcr.io/rabbitmq:latest
```

## Params
- RABBITMQ_DATA_DIR