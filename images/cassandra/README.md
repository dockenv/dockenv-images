# Cassandra

> Apache Cassandra is an open-source distributed storage system.

## Usage

```bash
$ docker run -d --name some-cassandra --network some-network -p 7000:7000 -v /my/own/datadir:/var/lib/cassandra cassandra:tag

```


### Make a cluster
`$ docker run --name some-cassandra2 -d --network some-network -e CASSANDRA_SEEDS=some-cassandra cassandra:tag
`