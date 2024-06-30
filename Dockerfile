# Használjuk az OpenJDK alapképet
FROM openjdk:17-jdk-slim

# Állítsuk be a munka könyvtárat
WORKDIR /app

# Másoljuk a jar fájlt a konténerbe
COPY build/libs/istio-service-demo-0.0.1-SNAPSHOT.jar app.jar

# Exponáljuk a 8080-as portot
EXPOSE 8080

# Állítsuk be az indítási parancsot
ENTRYPOINT ["java", "-jar", "app.jar"]
