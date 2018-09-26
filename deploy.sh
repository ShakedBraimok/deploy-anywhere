#!/bin/sh

echo "Createing Swarm with Jenkins Master & Agent services"
#--- MASTER ---#
docker pull jenkinsci/jenkins

docker swarm init

docker service create --name jenkins-master  -p 50000:50000 -p 80:8080 jenkinsci/jenkins:latest

#--- cp Pipeline files to the container (jenkins-master) in the path /opt/deployment-files ---#
containerId = $(docker ps -aqf "name=jenkins-master")
docker exec -u 0 -it $containerId mkdir /opt/deployment-files
docker cp pipeline/. $containerId:/opt/deployment-files/
docker exec -it $containerId cp /opt/deployment-files/credentials.xml /var/jenkins_home/

#--- Add Pipeline job to the master ---#
docker exec -it $containerId cp -r /opt/deployment-files/deployment_job /var/jenkins_home/jobs/

#--- Deploy latest version of my app ---#
docker pull shakedbraimok/example-app

#--- Run container ---#
docker run --name example-app -d --expose 8080 -p 127.0.0.1:8080:8080 -i -t shakedbraimok/example-app /bin/bash

#--- Run Listener ---#
python listener/listener.py &

