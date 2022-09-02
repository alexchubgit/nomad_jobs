## Resources
**These files are required by awx.**

- '/etc/tower/conf.d/credentials.py.tpl'
- '/etc/tower/SECRET_KEY'
- '/etc/tower/conf.d/environment.sh'
- '/etc/nginx/nginx.conf'

**Download as artifact, or create in some other way**
```go
artifact {
   source = "git::https://github.com/alexchubgit/nomad_job.git//awx_with_vars_templates"
}
```

**For working with template need this code**
```go
template {
  source        = "local/credentials.py.tpl"
  destination   = "local/credentials.py"
  change_mode   = "signal"
  change_signal = "SIGINT"
}
```

**And then you need to use docker volumes**
```go
volumes = [
  "local/SECRET_KEY:/etc/tower/SECRET_KEY",
  "local/environment.sh:/etc/tower/conf.d/environment.sh",
  "local/credentials.py:/etc/tower/conf.d/credentials.py",
  "/awx/projects:/var/lib/awx/projects"
]
```

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

## Using

```bash
nomad job plan awx.job
```

```bash
nomad job run -check-index 0 awx.job
```

**If nomad job already exits need to execute this command**

```bash
nomad job stop -purge awx
```

**If low allocation memory for container <500Mb will be problems with processes inside container awx_task**


## Call AWX template with cURL

```bash
curl -f -k -H 'Content-Type: application/json' -XPOST --user admin:password http://192.168.56.62/api/v2/job_templates/awx_template_name/launch/
```

