FROM openjdk:8
EXPOSE 8081
ADD target/*.jar *.jar
ENTRYPOINT ["java","-jar","/*.jar"]