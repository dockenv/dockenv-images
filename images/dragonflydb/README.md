# DragonflyDB

> Dragonfly is a drop-in Redis replacement that cuts costs and boosts performance. Designed to fully utilize the power of modern cloud hardware and deliver on the data demands of modern applications, Dragonfly frees developers from the limits of traditional in-memory data stores.

## Usage:

`docker run --name=dragonflydb --network=host --ulimit memlock=-1 -p 6379:6379 swr.ap-southeast-3.myhuaweicloud.com/dockenv/dragonfly`


## Connect

`redis-cli -h 127.0.0.1 -p 6379`