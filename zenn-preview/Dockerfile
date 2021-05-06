# copy from https://github.com/c-a-p-engineer/zenn-env/
# Copyright (c) 2020 こぴぺたん

FROM node:14

ENV NODE_PATH /opt/node_modules

WORKDIR /workspace

RUN apt-get -y update && apt-get install -y --no-install-recommends \
        git openssh-server curl \
    && apt-get -y clean 

RUN npm init --yes \
    && npm install -g zenn-cli@latest \
    && npx zenn init

RUN mkdir /run/sshd
ADD entrypoint.sh entrypoint.sh

# set root password
RUN echo "root:yez4jJbM9QhtwS959ejePw2mJHYVnKNqwArtn9u5" | chpasswd

# enable root login, and disable password authentication
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config && \
    sed -i 's/^ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config

EXPOSE 22
EXPOSE 8000

ENTRYPOINT ["bash", "entrypoint.sh"]
