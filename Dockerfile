FROM ghcr.io/someone-stole-my-name/docker-nvim:0.8.0

RUN npm install -g yaml-language-server

RUN cargo install stylua
ENV PATH "$PATH:/root/.cargo/bin"

WORKDIR /
