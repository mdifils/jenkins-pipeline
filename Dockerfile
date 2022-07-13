FROM openjdk:14-jdk-alpine as builder

WORKDIR /app
COPY . ./
RUN ./gradlew build

FROM openjdk:14-jdk-alpine

WORKDIR /app
COPY --from=builder /app/build/libs/caesar-cipher.jar /app/package.jar

ENTRYPOINT ["java", "-jar", "package.jar"]