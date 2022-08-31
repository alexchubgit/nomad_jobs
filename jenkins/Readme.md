
# Description

**Remember! Your hashicorp cluster must exists when you are starting nomad jobs**

## Jenkins server

* Plugin Blue Ocean
* Plugin Docker Pipeline
* Create ssh key inside jenkins docker

ключ надо создать докере мастера и передать в агент
`docker ps`
`docker exec -it master ssh-keygen -t rsa -C ""`


get public key from server for using inside agent

`docker exec -it 28642fb7666d cat /var/jenkins_home/.ssh/id_rsa`

      env {
        JENKINS_AGENT_SSH_PUBKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIMFOXMVYy8wESyUa5ko09HBz4yCHD0/Vrb/EoO1YPpoDL7+q48Tq77nKlczgu3SPhDO98r0w60EHrhuDSaL2sLIqH2jNmTV4GzGwi/4TkyUvy60WR1TRRtN1sT771W5ED28x5MOIZZ38kul5QQD5CokI/JqWiotywOOnzj14y1ymzMCIiz3bUHrEFOTWjXlz31wpH+ahCk9bNeFOAPyRPwtyEM/2eAkC/WOxrTDiI8FPMRDoFfPWkxnJsq4+V3UjQPrt9Sa335aRbD0Fqo9WAauXk6mKLjUeF97oBydWbnnSY4LwDrLS+JKMrXL9E88cqMFWmsOewRfjdyThKql0+Q7wJVjo3eBn++/3JZgAoiawuFQOZTuPpZNiRcdOIsFSAKAInA8B/Fg+4UPlQxqE417K9p3o0jvyKVleUG36uFZpCDvFXUJ9OHpX5beQfWJ89x7h+AMCSdFxm4HrNc3Ogz/gkEsQ0v+8mrQA+by9JMnP9Q31PIiexMGbdgJLg9fs="
      }

get secret key
`docker exec -it 8f0d02845ee4 cat ~/.jenkins/secrets/initialAdminPassword`


```
image = "jenkinsci/blueocean"

RUN jenkins-plugin-cli --plugins "blueocean:1.25.5 docker-workflow:1.28"

command = "/bin/bash"
args = ["jenkins-plugin-cli --plugins 'blueocean:1.25.5'"]
```


## Jenkins agent
For starting jenkins agent need

Image for Dockerfile
```
FROM jenkins/ssh-agent:latest-jdk11
USER root
```

Install git, sudo, vim, curl by jenkins docker client
```
RUN apt-get update
RUN apt-get install -y git sudo vim curl
```

Allowing jenkins user to run sudo commands
```
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
```

Avoid typing sudo in command line
```
RUN echo "alias docker='sudo docker '" >> /home/jenkins/.bashrc
```

Create my own docker image from Dockerfile 
`docker build - < Dockerfile -t alexchub/jenkins-agent-ssh:latest-jdk11`
`docker push alexchub/jenkins-agent-ssh:latest-jdk11`


***If you want build docker images then this is the most important command \
This command must be used on a virtual machine or host***
`chmod 777 /var/run/docker.sock`



## Необходимо добавить информацию о первоначальной настройке
##
##
##





# Example
## Example
### Example

* Example
  * Example
    * `Example`

Please note, you can add ` -D ` flag 

  * Remove all cluster's data
  ```
  cat <<< EOF | xargs -I{} ansible -i inventory.yml -m shell -a "systemctl stop {}; systemctl disable {}; systemctl daemon-reload; rm -rf /var/lib/{}; rm -rf /etc/systemd/system/{}.service; rm -rf /etc/{}" all
  EOF
  ```
