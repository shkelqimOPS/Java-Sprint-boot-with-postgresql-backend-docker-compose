FROM openjdk:8-jdk-alpine3.7 AS builder
RUN java -version

COPY . /usr/src/myapp/
WORKDIR /usr/src/myapp/
RUN apk --no-cache add maven && mvn --version
RUN mvn package

# Stage 2 (to create a downsized "container executable",)
FROM openjdk:8-jre-alpine3.7
WORKDIR /root/
COPY --from=builder /usr/src/myapp/target/users-mysql.jar .

ENTRYPOINT ["java", "-jar", "./users-mysql.jar"] 
