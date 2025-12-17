# InfluxDB

> InfluxDB is the open source time series database built for real-time analytic workloads.

## Usage

```bash
docker run \
    --name=influxdb \
    -p 8086:8086 \
    -v "$PWD/data:/var/lib/influxdb2" \
    -v "$PWD/config:/etc/influxdb2" \
    -e DOCKER_INFLUXDB_INIT_MODE=setup \
    -e DOCKER_INFLUXDB_INIT_USERNAME=dockenv \
    -e DOCKER_INFLUXDB_INIT_PASSWORD=dockpass \
    -e DOCKER_INFLUXDB_INIT_ORG=dockenv \
    -e DOCKER_INFLUXDB_INIT_BUCKET=dockenv \
    -e DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=dockenv
    swr.ap-southeast-3.myhuaweicloud.com/dockenv/influxdb:latest
```