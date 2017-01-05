FROM alpine:3.4
# In case the main package repositories are down, use the alternative:
# FROM gliderlabs/alpine:3.4

MAINTAINER Nikyle Nguyen <NLKNguyen@MSN.com>

ARG REQUIRE="sudo nodejs"
RUN apk update && apk upgrade \
      && apk add --no-cache ${REQUIRE}




#### DEFAULT USER ####
ARG USER=alpine
ENV USER ${USER}
RUN adduser -D ${USER} \
      && echo "${USER}   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 

#### CREATE APP DIRECTORY FOR USER ####
RUN mkdir -p /usr/src/app
RUN chown -R ${USER} /usr/src/app

#### SWITCH TO DEFAULT USER  ####
USER ${USER}


### CONFIG NPM when installing packages ###
# --no-bin-links by default
RUN npm config set bin-links false
# This is a common issue when running npm install in a Docker or Vagrant VM
# See: https://github.com/npm/npm/issues/9901

# Also, --no-optional by default
RUN npm config set optional false

RUN sudo npm install -g standard

RUN standard --version
#### BUILD ####
WORKDIR /usr/src/app

# add dependencies first, which don't change so often, to leverage image caching
COPY package.json .
RUN npm install --production

# add the rest of the source files; might copy package.json again but no big deal
COPY . .
#    ^ filter by .dockerignore
# RUN ls -a ~/.npm/
# RUN export PATH="/users/alpine/.node_modules_global/bin:$PATH"
# RUN npm test

#### READY TO USE ####

# Start working at the mounted directory
WORKDIR /mnt

# When docker run, should mount the host's current directory, where syntax_mapping.yml is located, to /mnt
CMD ["sh", "/usr/src/app/run.sh"]
