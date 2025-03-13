## ClickHouse
> ClickHouse® is a real-time analytics database management system

```bash
docker run -d \
    --name clickhouse-server \
    -p 18123:8123 \
    -p 19000:9000 \
    --ulimit nofile=262144:262144 \
    -v "$PWD/ch_data:/var/lib/clickhouse/" \
    -v "$PWD/ch_logs:/var/log/clickhouse-server/" \
    -v /path/to/your/config.xml:/etc/clickhouse-server/config.xml \
    -e CLICKHOUSE_USER=username \
    -e CLICKHOUSE_PASSWORD=dockpass \
    -e CLICKHOUSE_RUN_AS_ROOT=1 \
    -e CLICKHOUSE_DB=my_database \
    -e CLICKHOUSE_DEFAULT_ACCESS_MANAGEMENT=1 \
    -e CLICKHOUSE_SKIP_USER_SETUP=1 \
    clickhouse

```


## Directory
- /etc/clickhouse-server/config.d/*.xml - files with server configuration adjustments
- /etc/clickhouse-server/users.d/*.xml - files with user settings adjustments

docker run -d --name some-clickhouse-server --ulimit nofile=262144:262144  clickhouse


## More
- https://hub.docker.com/_/clickhouse