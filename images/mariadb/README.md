## Mariadb

## MariaDB Version -> Mysql Version
- 11.0-11.* -> 8
- 10.6 - 10.11 -> 8
- 10.2-10.4 -> 5.7
- 10.0 10.1 -> 5.6
- 5.5 -> 5.5

## 主要维护
- 10.11 10.10 10.6 10.5 10.4
- 11.*

### Usage

```bash
docker run -d \
    --name mariadb \
    -v /path/to/conf:/etc/mysql/conf.d \
    -v /path/to/datadir:/var/lib/mysql \
    --env MARIADB_USER=dockenv \
    --env MARIADB_PASSWORD=dockenv \
    --env MARIADB_ROOT_PASSWORD=dockenv  \
    ghcr.io/dockenv/mariadb:latest
```

## Params
- MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=1
- MARIADB_RANDOM_ROOT_PASSWORD=1

## Stopped Tags
- 10.1
- 10.2
- 10.3
- 10.4
- 10.7
- 10.8
- 10.9
- 10.10
- 11.0
- 11.1
- 11.3