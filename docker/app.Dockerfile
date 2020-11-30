# Node 12 used due to https://github.com/brianc/node-postgres/issues/2180
FROM node:12-slim as builder

RUN apt-get update || : && apt-get install -y \
    python \
    build-essential

COPY ./package*.json ./
RUN npm install
COPY . . 
RUN npm run build

FROM node:12-slim
USER node

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node --from=builder . .

ENTRYPOINT [ "npm", "run" ]