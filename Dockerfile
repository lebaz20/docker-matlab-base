FROM ubuntu:18.04

ADD matlab.txt /mcr-install/matlab.txt

RUN apt-get update && \
	apt-get install -y curl wget unzip xorg

# Install MATLAB runtime
RUN \
	cd /mcr-install && \
	wget -nv http://esd.mathworks.com/R2018a/Linux_x86_64/INST_522278/matlab_R2018a_glnxa64.zip && \
	unzip matlab_R2018a_glnxa64.zip && \
	mkdir /opt/mcr && \
	./install -inputFile matlab.txt && \
	cd / && \
	rm -rf mcr-install
