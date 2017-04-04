FROM ubuntu:16.04

RUN apt-get update && apt-get -y install maven openjdk-8-jdk xpra openssh-server firefox wget xterm
RUN wget http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/neon/3/eclipse-jee-neon-3-linux-gtk-x86_64.tar.gz && tar -xf eclipse-jee-neon-3-linux-gtk-x86_64.tar.gz

ENV GROUPID org.test
ENV ARTIFACTID lagomtest
ENV PACKAGE org.test
ENV VERSION 1.0-SNAPSHOT

RUN mvn archetype:generate -DarchetypeGroupId=com.lightbend.lagom -DarchetypeArtifactId=maven-archetype-lagom-java -DarchetypeVersion=1.3.1 -DgroupId=$GROUPID -DartifactId=$ARTIFACTID -Dversion=$VERSION -Dpackage=$PACKAGE -DinteractiveMode=false

COPY xpra.pwd /xpra.pwd
EXPOSE 7777

CMD ["/usr/bin/xpra", "start", "--daemon=no", "--bind-tcp=0.0.0.0:7777", "--auth=file", "--password-file=/xpra.pwd", "--start=/usr/bin/xterm", ":123"]
