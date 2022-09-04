## Description
Jenkins is an open source continuous integration/continuous delivery and deployment (CI/CD) automation software DevOps tool written in the Java programming language.

## Jenkins server
**In a jenkins nomad job you can change the mountpoint `/mnt/jenkins/server/`**
```go
mount {
  type = "volume"
  target = "/var/jenkins_home"
  source = "jenkins-home"
  readonly = false
  volume_options {
    no_copy = false
    driver_config {
      name = "local-persist"
      options = {
        mountpoint = "/mnt/jenkins/server/"
      }
    }
  }
}
```

## Using
```bash
nomad job plan jenkins.job
```

```bash
nomad job run -check-index 0 jenkins.job
```

**If nomad job already exits need to execute this command**
```bash
nomad job stop -purge jenkins
```


## Jenkins agent
**For starting jenkins agent need to create your own docker image from Dockerfile**

Image for Dockerfile
```dockerfile
FROM jenkins/ssh-agent:latest-jdk11
USER root
```

Install git, sudo, vim, curl by jenkins docker client
```dockerfile
RUN apt-get update
RUN apt-get install -y git sudo vim curl
```

Allowing jenkins user to run sudo commands
```dockerfile
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
```

Avoid typing sudo in command line
```dockerfile
RUN echo "alias docker='sudo docker '" >> /home/jenkins/.bashrc
```

**Build and push docker image from Dockerfile**
```bash
docker build - < Dockerfile -t alexchub/jenkins-agent-ssh:latest-jdk11
```

```bash
docker login
```

```bash
docker push alexchub/jenkins-agent-ssh:latest-jdk11
```

**Generate ssh key in Jenkins server container**
```bash
docker exec -it CONTAINER_ID ssh-keygen -t rsa -C ""
```

**Get public key from server for using inside agent**
```bash
docker exec -it CONTAINER_ID cat /var/jenkins_home/.ssh/id_rsa
```

```bash
cat /mnt/jenkins/server/.ssh/id_rsa
```

**Add the public key to the JENKINS_AGENT_SSH_PUBKEY environment variable**
```go
env {
  JENKINS_AGENT_SSH_PUBKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIMFOXMVYy8wESyUa5ko09HBz4yCHD0/Vrb/EoO1YPpoDL7+q48Tq77nKlczgu3SPhDO98r0w60EHrhuDSaL2sLIqH2jNmTV4GzGwi/4TkyUvy60WR1TRRtN1sT771W5ED28x5MOIZZ38kul5QQD5CokI/JqWiotywOOnzj14y1ymzMCIiz3bUHrEFOTWjXlz31wpH+ahCk9bNeFOAPyRPwtyEM/2eAkC/WOxrTDiI8FPMRDoFfPWkxnJsq4+V3UjQPrt9Sa335aRbD0Fqo9WAauXk6mKLjUeF97oBydWbnnSY4LwDrLS+JKMrXL9E88cqMFWmsOewRfjdyThKql0+Q7wJVjo3eBn++/3JZgAoiawuFQOZTuPpZNiRcdOIsFSAKAInA8B/Fg+4UPlQxqE417K9p3o0jvyKVleUG36uFZpCDvFXUJ9OHpX5beQfWJ89x7h+AMCSdFxm4HrNc3Ogz/gkEsQ0v+8mrQA+by9JMnP9Q31PIiexMGbdgJLg9fs="
}
```

## Using
```bash
nomad job plan jenkins_agent.job
```

```bash
nomad job run -check-index 0 jenkins_agent.job
```

**If nomad job already exits need to execute this command**
```bash
nomad job stop -purge jenkins_agent
```


**If you want build docker images then this is the most important command \
This command must be used on a virtual machine or host**

```bash
chmod 777 /var/run/docker.sock
```


## Setting

**Get secret key**
```bash
docker exec -it CONTAINER_ID cat ~/.jenkins/secrets/initialAdminPassword
```

```bash
cat /mnt/jenkins/server/secrets/initialAdminPassword
```

## Plugins

**List of plugins to install**
* Plugin Blue Ocean
* Plugin Docker Pipeline

**Or you can use image with blue ocean plugin**
```dockerfile
image = "jenkinsci/blueocean"
```

**Or you can create your own Dockerfile with plugins**
```dockerfile
RUN jenkins-plugin-cli --plugins "blueocean:1.25.5"
```

