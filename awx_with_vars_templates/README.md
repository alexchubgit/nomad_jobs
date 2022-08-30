## Resources
These files are required by awx. Download as artifact, or create in some other way

* '/etc/tower/SECRET_KEY'
* '/etc/tower/conf.d/environment.sh'
* '/etc/tower/conf.d/credentials.py'
* '/etc/nginx/nginx.conf'




## Call AWX template with CURL 
`curl -f -k -H 'Content-Type: application/json' -XPOST --user admin:password http://192.168.56.62/api/v2/job_templates/ping/launch/`


Download as artifact, or create in some other way


**If low allocation memory for container <500Mb will be problems with processes inside container awx_task**



