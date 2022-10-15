FROM jenkins/jenkins:latest

#Disable manual setup wizard for jenkins
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

#Enable server configuration as a code
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

# Install any and all Jenkins plugins on startup
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Setup any Jenkins server configuration on startup
COPY casc.yaml /var/jenkins_home/casc.yaml

