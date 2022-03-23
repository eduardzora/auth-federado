FROM node:12-alpine as builder

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

RUN npm config set unsafe-perm true
RUN npm install -g typescript
RUN npm install -g ts-node
USER node
RUN npm install


COPY --chown=node:node . .

EXPOSE 4000
CMD [ "npm", "start" ]

##Execute
#docker build -t vlondonoo/auth .
#docker run -it -p 4000:4000 vlondonoo/auth 