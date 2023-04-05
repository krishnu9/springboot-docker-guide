FROM amazoncorretto:17-alpine-jdk

WORKDIR /app

# COPY . .

# RUN ./mvnw package

# RUN cp target/*.jar app.jar

COPY target/*.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]
