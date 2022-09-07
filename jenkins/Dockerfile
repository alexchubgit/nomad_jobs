FROM jenkins/ssh-agent:latest-jdk11

USER root

# Install git, sudo, vim, curl by jenkins docker client
RUN apt-get update
RUN apt-get install -y git sudo vim curl

# Allowing jenkins user to run sudo commands
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Avoid typing sudo in command line
RUN echo "alias docker='sudo docker '" >> /home/jenkins/.bashrc
