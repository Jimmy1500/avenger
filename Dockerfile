FROM openjdk:12-jdk-alpine

VOLUME /tmp
ADD build/libs/voiceoftalent-api-1.0-SNAPSHOT.jar app.jar

ENV JAVA_OPTS=""

RUN apk update
RUN apk add ffmpeg

ENTRYPOINT [ "/bin/sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
