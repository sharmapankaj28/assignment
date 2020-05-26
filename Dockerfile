FROM gitlab/gitlab-ce
RUN export GITLAB_HOME=/srv
RUN mkdir -p /opt/java/openjdk
ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"
RUN apt update && apt install -y openjdk-8-jdk
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
RUN echo "deb https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list
RUN wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
CMD java -jar jenkins.war --httpPort=8181
#RUN wget http://192.168.101.53:8181/jnlpJars/jenkins-cli.jar
#CMD java -jar jenkins-cli.jar -s "http://192.168.101.53:8181" --auth "jenkins:TomTom22#" install-plugin       https://updates.jenkins.io/download/plugins/snyk-security-scanner/2.10.4/snyk-security-scanner.hpi
EXPOSE 8181/tcp 22/tcp 80/tcp 443/tcp
