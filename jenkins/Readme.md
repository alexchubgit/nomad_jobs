## Jenkins and Jenkins agent on Nomad
These nomad jobs run Jenkins and Jenkins agent in docker containers

## Prerequisites
Before you begin we recommend you read about the basic building blocks 
- Docker 
- Nomad

## Using Jenkins server
```bash
nomad job run jenkins.job
```

**If nomad job already exits need to execute this command**
```bash
nomad job stop -purge jenkins
```

**Take the secret key to configure the Jenkins server and enter the UI**
```bash
docker exec -it CONTAINER_ID cat ~/.jenkins/secrets/initialAdminPassword
```

```bash
cat /mnt/jenkins/server/secrets/initialAdminPassword
```

**Generate an SSH key pair in the Jenkins server container**
```bash
docker exec -it CONTAINER_ID ssh-keygen -t rsa -C ""
```

**Add private key inside UI** 
[link](https://www.jenkins.io/doc/book/using/using-agents/#generating-an-ssh-key-pair)


## Using Jenkins agents
**Build and push your own docker image from Dockerfile**
```bash
docker build - < Dockerfile -t alexchub/jenkins-agent-ssh:latest-jdk11
```

```bash
docker login
```

```bash
docker push alexchub/jenkins-agent-ssh:latest-jdk11
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

## Using Jenkins agent
```bash
nomad job run jenkins_agent.job
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

