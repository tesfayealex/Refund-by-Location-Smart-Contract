FROM ubuntu:20.04

RUN apt-get update && apt-get install build-essential postgresql-client binutils libproj-dev  -y
RUN apt install cabextract -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y software-properties-common && apt-get --allow-releaseinfo-change update
RUN add-apt-repository ppa:deadsnakes/ppa && apt-get update && apt-get install -y npm nodejs && npm -i -g truffle
RUN apt-get install -y git

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN mkdir /app

# set the working directory to /mining
WORKDIR /app

# copy the current directory contents into the container at /mining
COPY . /app/
RUN ls -la /app/
RUN cd /truffle/
RUN truffle --migrate
RUN cd /client/
EXPOSE 3000
RUN npm install
RUN npm run
ENTRYPOINT [ "setup.sh" ]