## Description

This repo contants different nomad jobs

## Connect to PostgreSQL
`psql -U awx -h 192.168.56.62`

## Connect to Memcached
`telnet 192.168.56.62 11211 and for exit Ctrl + ]`

## Memcached testing
`add mykey 0 60 11`
`hello world`
STORED
`get mykey`
VALUE mykey 0 11
hello world
END

## Check open ports inside docker container without netstat
`declare -a array=($(tail -n +2 /proc/net/tcp | cut -d":" -f"3"|cut -d" " -f"1")) && for port in ${array[@]}; do echo $((0x$port)); done`

`declare -a array=($(tail -n +2 /proc/net/tcp | cut -d":" -f"3"|cut -d" " -f"1")) && for port in ${array[@]}; do echo $((0x$port)); done | sort | uniq`

## Getting an ip address without entering the container (получение ip адреса не заходя в контейнер)
`docker exec prometheus-0a66754f-5c40-3027-0601-7e0b4d5fb87d ip addr show | grep -oE "inet [^ ]+"`

## Adding file into docker container
`echo "aabbcc" > SECRET_KEY`
`docker cp SECRET_KEY 931efe47a463:/etc/tower/SECRET_KEY`