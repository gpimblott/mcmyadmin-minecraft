# McMyAdmin-minecraft server
This repo contains the Dockerfile for DockerHub automated builds of McMyAdmin (https://www.mcmyadmin.com/) Minecraft servers.  In a single command you can create a new minecraft server in a Docker container.  Then stop and start whenever you need it.

By changing the exposed ports you can run multiple minecraft servers on a single Docker server.  By additionally specifying host volume mount you can keep all of your minecraft worlds on your host and mount into the Docker image as required.

The image exposes ports 8080, for McMyAdmin, and 25565 for the Minecraft server by default.

# Pull from DockerHub

The built image is on DockerHub (https://hub.docker.com/r/gpimblott/mcmyadmin-minecraft/)

To pull directly onto your Docker host use the following command:

 `docker pull gpimblott/mcmyadmin-minecraft`

# Create your first server

Minecraft containers are created using the following command

`docker run -p {AdminPort}:8080 -p {MinecraftPort}:25565 -i -t -d --name {ContainerName} gpimblott/mcmyadmin-minecraft`

Example:
 `docker run -p 8080:8080 -p 25565:25565 -i -t -d --name myfirstserver gpimblott/mcmyadmin-minecraft`

Create a second server , note the increment of the admin and minecraft server ports

 `docker run -p 8081:8080 -p 25566:25565 -i -t -d --name mysecondserver gpimblott/mcmyadmin-minecraft`

# Configuring the server
Once created log into the web console for McMyAdmin.

 `http://{dockerIP}:8080` and `http://{dockerIP}:8081` respectively for the examples above
 
Once the instance is created log into the admin console and following the prompts. 

The servers can then be stopped and started as needed.

`docker stop {containerId}`
`docker start {containerId}`

# Mounting existing worlds

Copy the worlds into a directory on your Docker host. Then use the command below to create a container for a specific world:

`docker run -p {admin port to export}:8080 -p {minecraft server port to expose}:25565 -v {absolute path of world on host}/:/home/minecraft/mcmyadmin/Minecraft/world -i -t -d --name myfirstserver gpimblott/mcmyadmin-minecraft`


It's a great way to keep multiple Minecraft worlds on the go for the family ;)
