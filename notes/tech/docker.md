Docker

Note: NEED Colima now to run docker  Build Image
docker build --tag <name> .


Run Image as Container:
————————————————
docker run --publish 8000:8080 --detach --name <name> <tagName>

Explaination
* --publish { local port : docker port } asks Docker to forward traffic incoming on the host’s port 8000 to the container’s port 8080. Containers have their own private set of ports, so if you want to reach one from the network, you have to forward traffic to it in this way. Otherwise, firewall rules will prevent all network traffic from reaching your container, as a default security posture.
* --detach asks Docker to run this container in the background.
* --name specifies a name with which you can refer to your container in subsequent commands, in this case bb.


To create a docker image
——————————————
./gradlew clean build
docker build -t <repo name>



Commands:
——————————————————
- List Images: docker images
- List Containers: docker ps  -a
- Stop running Container: docker kill (name)
- Delete container: docker rm (name)
- Start container: docker start (name)
- Delete all containers: docker rm -vf $(docker ps -aq)
- Delete all images: docker rmi -f $(docker images -aq)



Prevent cache in Dockerfile ——————————
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache



Dockerfile Template
————————————
FROM docker.target.com/darre/darre-base-image:latest
ENV PORT 80
ARG JAR_FILE=build/libs/feignDemo-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]



Dockerfile Target Template
————————————
FROM docker.target.com/darre/darre-base-image:latest

RUN wget -O /usr/local/bin/dumb-init https://binrepo.target.com/artifactory/cpe-yum-source/up-agent-tools/dumb-init_1.2.2_amd64 && \
chmod u+x /usr/local/bin/dumb-init

ADD build/distributions/on-demand-replenishments.tar /

ENTRYPOINT ["/usr/local/bin/dumb-init", "--", "/on-demand-replenishments/bin/on-demand-replenishments"]




