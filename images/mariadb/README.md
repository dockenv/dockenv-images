## Mariadb

## MariaDB Version -> Mysql Version
- 11.0-11.* -> 8
- 10.6 - 10.11 -> 8
- 10.2-10.4 -> 5.7
- 10.0 10.1 -> 5.6
- 5.5 -> 5.5

### How to use this image?

`docker run --detach --name mariadb --env MARIADB_USER=user --env MARIADB_PASSWORD=my_cool_secret --env MARIADB_ROOT_PASSWORD=my-secret-pw  ghcr.io/dockenv/mariadb:latest`
