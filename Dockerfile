# copy from https://github.com/c-a-p-engineer/zenn-env/
# Copyright (c) 2020 こぴぺたん

FROM node:14

ENV NODE_PATH /opt/node_modules

WORKDIR /workspace

RUN apt-get -y update && apt-get install -y --no-install-recommends \
        git \
    && apt-get -y clean 

RUN npm init --yes \
    && npm install -g zenn-cli@latest \
    && npx zenn init

CMD npx zenn preview
