FROM maven:3.6.0-jdk-8-slim AS build

WORKDIR /home/app

COPY . .

RUN mvn clean package

FROM openjdk:8u131-jre

MAINTAINER Richard Chesterwood "richard@inceptiontraining.co.uk"

COPY --from=build /home/app/target/positionsimulator-0.0.1-SNAPSHOT.jar webapp.jar

CMD ["java","-jar","webapp.jar"]
