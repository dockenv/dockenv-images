# Redis
> Redis is an open source key-value store that functions as a data structure server.

## Redis VS RedisStack

## Redis
- 单一的数据库引擎

## RedisStack
- 由 Redis Stack Server、RedisInsight 和 Redis Stack Client SDK 组成

## Redis Insight
- Official GUI for Redis

## Redis Stack Server
- 由 Redis，RedisSearch，RedisJSON，RedisGraph，RedisTimeSeries 和 RedisBloom 组成。
- 支持索引、全文搜索、图形建模、时间序列等功能。

### start with persistent storage
`$ docker run --name some-redis -d redis redis-server --appendonly yes`
> If persistence is enabled, data is stored in the VOLUME /data, which can be used with --volumes-from some-volume-container or -v /docker/host/dir:/data (see docs.docker volumes).

> For more about Redis Persistence, see http://redis.io/topics/persistence.

### connecting via redis-cli
`$ docker run -it --network some-network --rm redis redis-cli -h some-redis`

Additionally, If you want to use your own redis.conf ...
You can create your own Dockerfile that adds a redis.conf from the context into /data/, like so.
```Dockerfile
FROM redis
COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
```

Alternatively, you can specify something along the same lines with docker run options.

`$ docker run -v /myredis/conf:/usr/local/etc/redis --name myredis redis redis-server /usr/local/etc/redis/redis.conf`


> Where /myredis/conf/ is a local directory containing your redis.conf file. Using this method means that there is no need for you to have a Dockerfile for your redis container.

The mapped directory should be writable, as depending on the configuration and mode of operation, Redis may need to create additional configuration files or rewrite existing ones.

## Run Redis Stack
- $ docker run -v `pwd`/local-redis-stack.conf:/redis-stack.conf -p 6379:6379 redis/redis-stack-server:latest


## Redis Stack Args
To pass in arbitrary configuration changes, you can set any of these environment variables:

- CONFFILE: Config File Path default `/redis-stack.conf`
- REDIS_ARGS: extra arguments for Redis
- REDISEARCH_ARGS: arguments for RediSearch
- REDISJSON_ARGS: arguments for RedisJSON
- REDISGRAPH_ARGS: arguments for RedisGraph
- REDISTIMESERIES_ARGS: arguments for RedisTimeSeries
- REDISBLOOM_ARGS: arguments for RedisBloom

For example, here's how to use the REDIS_ARGS environment variable to pass the requirepass directive to Redis:

docker run -e REDIS_ARGS="--requirepass redis-stack" redis/redis-stack-server:latest

Here's how to set a retention policy for RedisTimeSeries:

docker run -e REDISTIMESERIES_ARGS="RETENTION_POLICY=20" redis/redis-stack-server:latest
