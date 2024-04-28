## Usage

```bash
docker run \
    -p 8086:8086 \
    -v "$PWD/data:/var/lib/influxdb2" \
    -v "$PWD/config:/etc/influxdb2" \
    -e DOCKER_INFLUXDB_INIT_MODE=setup \
    -e DOCKER_INFLUXDB_INIT_USERNAME=dockenv \
    -e DOCKER_INFLUXDB_INIT_PASSWORD=dockenv \
    -e DOCKER_INFLUXDB_INIT_ORG=dockenv \
    -e DOCKER_INFLUXDB_INIT_BUCKET=dockenv \
    -e DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=dockenv
    ghcr.io/dockenv/influxdb:latest
```