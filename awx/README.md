# Resources
These files are required by awx version 9.2.0

- '/etc/tower/SECRET_KEY'
- '/etc/tower/conf.d/environment.sh'
- '/etc/tower/conf.d/credentials.py'
- '/etc/nginx/nginx.conf'

Download as artifact, or create in some other way


If low allocation memory for container (<500Mb) will be problems with processes inside container awx_task





##Postgres
#psql -U awx -h 192.168.56.62

##Memcached
#telnet 192.168.56.62 11211 and for exit Ctrl + ]
##Memcached testing
#add mykey 0 60 11
#hello world
#STORED
#get mykey
#VALUE mykey 0 11
#hello world
#END