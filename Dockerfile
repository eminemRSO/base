FROM maven:3.6.3-openjdk-14 AS build
COPY ./ /app
WORKDIR /app
RUN mvn clean package -U

FROM adoptopenjdk:14-jre-hotspot
RUN mkdir /app
WORKDIR /app
COPY --from=build ./app/api/target/image-catalog-api-1.0.0-SNAPSHOT.jar /app
EXPOSE 8080
CMD ["java", "-jar", "image-catalog-api-1.0.0-SNAPSHOT.jar"]
