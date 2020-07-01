FROM node:10.21.0-alpine
WORKDIR /src
ADD     yarn.lock package.json /src/
RUN     yarn
ADD     . /src
CMD     ["npm", "start"]
