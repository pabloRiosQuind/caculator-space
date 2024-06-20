FROM gradle:7.3.3-jdk17 AS build
WORKDIR /usr/src/app
COPY --chown=gradle:gradle . .
RUN gradle build
FROM openjdk:17-jdk-slim
COPY --from=build /usr/src/app/build/libs/Calculator-0.0.1-SNAPSHOT.jar calculadira.jar
EXPOSE 8080
CMD ["java","jar", "calculadora.jar"]