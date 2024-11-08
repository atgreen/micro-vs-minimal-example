FROM registry.redhat.io/ubi9/openjdk-21-runtime
COPY target/*.jar /opt/spring-petclinic.jar
CMD java -jar /opt/spring-petclinic.jar
EXPOSE 8080
