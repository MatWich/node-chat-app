FROM ubuntu:latest

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
  
ENV TZ=Europe/Warsaw

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update

RUN apt-get install npm -y
RUN apt-get -y install git 

RUN git clone https://github.com/binhxn/node-chat-app.git

WORKDIR node-chat-app

RUN npm install


