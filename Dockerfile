FROM fank243/dragonwell:1.8.0_345

WORKDIR /app

COPY sentinel-dashboard-1.8.6.jar app.jar

RUN chmod -R +x app.jar

EXPOSE 8858

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]