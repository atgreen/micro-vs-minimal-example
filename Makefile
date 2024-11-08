all: spring-petclinic-ubi9-minimal.trivy.txt spring-petclinic-ubi9-micro.trivy.txt

spring-petclinic-ubi9-minimal.trivy.txt: spring-petclinic/target/spring-petclinic-3.3.0-SNAPSHOT.jar
	podman build -f Dockerfile.minimal -t spring-petclinic-ubi9-minimal .
	trivy image spring-petclinic-ubi9-minimal > $@

spring-petclinic-ubi9-micro.trivy.txt: spring-petclinic/target/spring-petclinic-3.3.0-SNAPSHOT.jar
	podman build -f Dockerfile.micro -t spring-petclinic-ubi9-micro .
	trivy image spring-petclinic-ubi9-micro > $@

spring-petclinic/target/spring-petclinic-3.3.0-SNAPSHOT.jar:
	git clone https://github.com/spring-projects/spring-petclinic.git
	(cd spring-petclinic && mvn package)

clean:
	@rm -rf *.trivy.txt *~
