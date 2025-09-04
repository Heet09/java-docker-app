FROM alpine:latest AS base
RUN apk add --no-cache openjdk17
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH=$JAVA_HOME/bin:$PATH

FROM base
WORKDIR /app
COPY target/demo-0.0.1-SNAPSHOT.jar ./demo-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
