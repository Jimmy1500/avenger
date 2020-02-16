FROM openjdk:12-jdk-alpine

VOLUME /tmp
ADD build/libs/quant-0.0.1-SNAPSHOT.jar app.jar

ENV JAVA_OPTS=""
ENTRYPOINT [ "/bin/sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
