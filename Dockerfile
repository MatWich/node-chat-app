FROM ubuntu:latest

ENV TZ=Europe/Warsaw

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update

RUN apt-get install npm -y
RUN apt-get -y install git 

RUN git clone https://github.com/binhxn/node-chat-app.git

WORKDIR node-chat-app

COPY * /


