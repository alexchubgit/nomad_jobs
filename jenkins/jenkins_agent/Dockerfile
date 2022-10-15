FROM jenkins/ssh-agent:latest-jdk11

USER root

# Install git, sudo, vim, curl by jenkins docker client
RUN apt-get update
RUN apt-get install -y git sudo vim curl
