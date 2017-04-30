FROM java:8u111-jre
MAINTAINER Gordon Pimblott "gordon@pimblott.com"

# Update system
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install screen -y

# Add minecraft user

RUN	useradd minecraft -m -s /bin/bash

WORKDIR /usr/local/
RUN 	wget http://mcmyadmin.com/Downloads/etc.zip && \ 
	unzip etc.zip && \
	rm etc.zip

RUN 	mkdir /home/minecraft/mcmyadmin && \
	cd /home/minecraft/mcmyadmin && \
	wget http://mcmyadmin.com/Downloads/MCMA2_glibc26_2.zip && \
	unzip MCMA2_glibc26_2.zip && \
	rm MCMA2_glibc26_2.zip

WORKDIR	/home/minecraft/mcmyadmin

RUN 	./MCMA2_Linux_x86_64 -setpass password -configonly -nonotice 

RUN	chown -R minecraft:minecraft /home/minecraft

EXPOSE	8080
EXPOSE	25565

USER	minecraft
WORKDIR /home/minecraft/mcmyadmin

#ENTRYPOINT ["screen ./MCMA2_Linux_86_64"]
CMD 	cd /home/minecraft/mcmyadmin && \
	screen ./MCMA2_Linux_x86_64

#ENTRYPOINT 	["/home/minecraft/mcmyadmin/MCMA2_Linux_x86_64"]
