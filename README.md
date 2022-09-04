## Description
The Nomad job specification (or "jobspec" for short) defines the schema for Nomad jobs. Nomad jobs are specified in HCL, which aims to strike a balance between human readable and editable, and machine-friendly.

## Connect to PostgreSQL
```bash
psql -U awx -h 192.168.56.62
```

## Connect to Memcached
```bash
telnet 192.168.56.62 11211 and for exit Ctrl + ]
```

## Memcached testing
```bash
add mykey 0 60 11
```

```bash
hello world
```

```properties
STORED
```

```bash
get mykey
```

```properties
VALUE mykey 0 11
hello world
END
```

## Check open ports inside docker container without netstat
```bash
declare -a array=($(tail -n +2 /proc/net/tcp | cut -d":" -f"3"|cut -d" " -f"1")) && for port in ${array[@]}; do echo $((0x$port)); done
```

```bash
declare -a array=($(tail -n +2 /proc/net/tcp | cut -d":" -f"3"|cut -d" " -f"1")) && for port in ${array[@]}; do echo $((0x$port)); done | sort | uniq
```

## Getting an ip address without entering the container (получение ip адреса не заходя в контейнер)
```bash
docker exec CONTAINER_ID ip addr show | grep -oE "inet [^ ]+"
```

## Adding file into docker container
```bash
echo "aabbcc" > SECRET_KEY
```

```bash
docker cp SECRET_KEY CONTAINER_ID:/etc/tower/SECRET_KEY
```