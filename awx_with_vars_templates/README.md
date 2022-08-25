# Resources
These files are required by awx. Download as artifact, or create in some other way

- '/etc/tower/SECRET_KEY'
- '/etc/tower/conf.d/environment.sh'
- '/etc/tower/conf.d/credentials.py'
- '/etc/nginx/nginx.conf'


## Adding file into docker container
#echo "aabbcc" > SECRET_KEY
#docker cp SECRET_KEY 931efe47a463:/etc/tower/SECRET_KEY

## Check open ports without netstat
#declare -a array=($(tail -n +2 /proc/net/tcp | cut -d":" -f"3"|cut -d" " -f"1")) && for port in ${array[@]}; do echo $((0x$port)); done
#declare -a array=($(tail -n +2 /proc/net/tcp | cut -d":" -f"3"|cut -d" " -f"1")) && for port in ${array[@]}; do echo $((0x$port)); done | sort | uniq

## Connect to PostgreSQL
#psql -U awx -h 192.168.56.62


## Call AWX template with CURL 
#curl -f -k -H 'Content-Type: application/json' -XPOST --user admin:password http://192.168.56.62/api/v2/job_templates/ping/launch/
