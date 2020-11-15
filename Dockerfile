FROM jenkins/jenkins:lts
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]