FROM node:19-slim

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./
COPY ./node-chatgpt-api ./node-chatgpt-api
RUN yarn install --frozen-lockfile --production && yarn cache clean

COPY ./tsconfig.json ./tsconfig.json
COPY ./src ./src
RUN yarn build

VOLUME /storage
ENV DATA_PATH="/storage"

CMD yarn start
