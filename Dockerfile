FROM openjdk:11 AS build

COPY . .
RUN chmod +x gradlew
RUN ./gradlew build

FROM openjdk:11
WORKDIR e-commerce
COPY --from=build e-commerce/build/libs*.jar e-commerce.jar
ENTRYPOINT ["java", "-jar", "e-commerce.jar"]