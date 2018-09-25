# deploy-anywhere

## deploy.sh 
This script creates a full environment for development based Docker containers & Jenkins Pipeline .

**The environment contains:**
- Jenkins Master & Slave on Swarm.
- Listener (for DockerHub), created with Python Flask.
- Container for Maven app.
- Pipeline job for the Maven-app build & update image in registry .


## The Flow
![alt text](https://github.com/ShakedBraimok/deploy-anywhere/blob/master/flow.png)

