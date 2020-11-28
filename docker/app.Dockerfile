FROM node:lts-slim as builder

RUN apt-get update || : && apt-get install -y \
    python \
    build-essential

COPY ./package*.json ./
RUN npm install
COPY . . 
RUN npm run build

FROM node:lts-slim
USER node

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node --from=builder . .

ENTRYPOINT [ "npm", "run" ]