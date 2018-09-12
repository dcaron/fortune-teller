FROM openjdk:8-jre-alpine
MAINTAINER David Caron <dcaron@pivotal.io>
ARG JAR_FILE
ADD ./target/${JAR_FILE} /fortune-teller-ui.jar
RUN sh -c 'touch /fortune-teller-ui.jar'
ENTRYPOINT ["/usr/bin/java", "-jar", "/fortune-teller-ui.jar"]