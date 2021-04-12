FROM openjdk:8
ADD target/Spring-selenium.jar Spring-selenium.jar
EXPOSE 8080
CMD java -jar Spring-selenium.jar


