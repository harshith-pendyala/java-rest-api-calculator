FROM openjdk:11
EXPOSE 8081
ADD target/*.jar *.jar
ENTRYPOINT ["java","-jar","/*.jar"]