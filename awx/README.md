## AWX (Ansible Tower) on Nomad
AWX is an open source web application that provides a user interface, REST API, and task engine for Ansible. It's the open source version of the Ansible Tower. The AWX allows you to manage Ansible playbooks, inventories, and schedule jobs to run using the web interface.

## Before You Begin
Before you begin we recommend you read about the basic building blocks that assemble a 

- 
- 

## Prerequisites

- Docker 
- Nomad


## Using
```bash
nomad job plan awx.job
```

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

