# McMyAdmin-minecraft server
This repo contains the Dockerfile for DockerHub automated builds

This creates an image containing the McMyAdmin Minecraft admin console, enabling multiple minecraft servers to be run on a single server.

The image exposes ports 8080, for McMyAdmin, and 25565 for the Minecraft server.

# Create your first server
docker run -p 8080:8080 -p 25565:25565 -i -t -d --name myfirstserver gpimblott/minecraft

# Create a second server - note the port changes
docker run -p 8081:8080 -p 25566:25565 -i -t -d --name myfirstserver gpimblott/minecraft

Once the instance is created log into the admin console and following the prompts.  The Minecraft server can then be started.

The servers can then be stopped and started as needed.

Great way to keep multiple Minecraft worlds on the go for the family ;)
