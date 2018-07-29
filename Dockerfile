FROM ubuntu:18.04

ADD matlab.txt /mcr-install/matlab.txt

RUN apt-get update && \
	apt-get install -y curl wget unzip xorg

# Install MATLAB runtime
RUN \
	cd /mcr-install && \
	wget -nv http://de.mathworks.com/supportfiles/downloads/R2018a/deployment_files/R2018a/installers/glnxa64/MCR_R2018a_glnxa64_installer.zip && \
	unzip MCR_R2018a_glnxa64_installer.zip && \
	mkdir /opt/mcr && \
	./install -inputFile matlab.txt && \
	cd / && \
	rm -rf mcr-install
