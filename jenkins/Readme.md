
# SERVER

# Plugin Blue Ocean
# Plugin Docker Pipeline
# Create ssh key inside jenkins docker

#ключ надо создать докере мастера и передать в агент
#docker exec -it master ssh-keygen -t rsa -C "" 


# image = "jenkinsci/blueocean"

# RUN jenkins-plugin-cli --plugins "blueocean:1.25.5 docker-workflow:1.28"

# command = "/bin/bash"
# args = ["jenkins-plugin-cli --plugins 'blueocean:1.25.5'"]



# CLIENT
# Create my own docker image (Dockerfile and then... ) 
docker build - < Dockerfile -t alexchub/jenkins-agent-ssh:latest-jdk11
docker push alexchub/jenkins-agent-ssh:latest-jdk11

# image = "jenkins/ssh-agent:latest-jdk11"


# Install git, sudo, vim by jenkins docker client
# Add password to jenkins user
# Add jenkins user to sudo group

# ## allowing jenkins user to run sudo commands
# RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# ## avoid typing sudo in command line
# RUN echo "alias docker='sudo docker '" >> /home/jenkins/.bashrc



# this is the most important command
CMD chmod 777 /var/run/docker.sock


# Необходимо добавить информацию о первоначальной настройке
##
##
##