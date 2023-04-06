# Docker starter - SpringBoot project with Maven

## 1. Build Docker image from `.jar` artifact only
Use the following `Dockerfile`
```
FROM amazoncorretto:17-alpine-jdk
WORKDIR /app
COPY target/*.jar app.jar
ENTRYPOINT [ "java", "-jar", "app.jar" ]
```
Build the project using Maven
```
./mvnw clean package
```
Build the Docker image using the `.jar` artifact created from Maven build.
```
docker build -t springbootrestapi .
```
Run the container image
```
docker run -it -p 8080:8080 springbootrestapi
```
**OR**
## 2. Run Maven build while building docker image
Use the following `Dockerfile`
```
FROM amazoncorretto:17-alpine-jdk
WORKDIR /app
COPY . .
RUN ./mvnw package
RUN cp target/*.jar app.jar
ENTRYPOINT [ "java", "-jar", "app.jar" ]
```
Add `target/` dorectory to `.dockerignore` file.
```
.vscode/
target/
```
Build the container image
```
docker build -t springbootrestapi .
```
Run the container image
```
docker run -it -p 8080:8080 springbootrestapi
```
---
Run the following in a terminal to invoke the api
```
curl localhost:8080/hello
```
Thanks 😉

