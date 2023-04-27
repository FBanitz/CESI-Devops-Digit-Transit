FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
RUN npm ci --omit=dev

COPY . .
EXPOSE 3000

CMD [ "npm", "start" ] 
#Fichier .dockerignore. Idem.

node_modules
npm-debug.log
