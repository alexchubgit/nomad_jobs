## AWX (Ansible Tower) on Nomad
This nomad job runs AWX in a docker container 

## Prerequisites
Before you begin we recommend you read about the basic building blocks 
- Docker 
- Nomad

## Using
```bash
nomad job run awx.job
```

**If nomad job already exits need to execute this command**
```bash
nomad job stop -purge awx
```

**If low allocation memory for container <500Mb will be problems with processes inside container awx_task**


## Resources
**These files are required by AWX. Download as artifact, or create in some other way**

- '/etc/tower/conf.d/credentials.py.tpl'
- '/etc/tower/SECRET_KEY'
- '/etc/tower/conf.d/environment.sh'
- '/etc/nginx/nginx.conf'


**You can also change your login and password for POSTGRESQL, RABBITMQ and AWX**
```go
env {
  POSTGRES_USER     = "awx"
  POSTGRES_PASSWORD = "awxpass"
}

env {
  RABBITMQ_DEFAULT_USER = "guest"
  RABBITMQ_DEFAULT_PASS = "awxpass"
}

env {
  DATABASE_USER      = "awx"
  DATABASE_PASSWORD  = "awxpass"

  RABBITMQ_USER      = "guest"
  RABBITMQ_PASS      = "awxpass"

  AWX_ADMIN_USER     = "admin"
  AWX_ADMIN_PASSWORD = "password"
}
```

## Call AWX template with cURL
```bash
curl -f -k -H 'Content-Type: application/json' -XPOST --user admin:password http://192.168.56.62/api/v2/job_templates/awx_template_name/launch/
```

