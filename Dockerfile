FROM node:latest

# install the latest nodejs & npm
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt update \
    && apt install -y nodejs \
       npm \
    && apt clean

RUN npm install -g typescript

WORKDIR /home/app
USER node
ENV PORT 3000

EXPOSE 3000