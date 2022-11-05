FROM ghcr.io/someone-stole-my-name/docker-nvim:0.8.0

RUN apk --no-cache add \
    cargo \
    npm \
    perl \
    perl-json-xs \
    perl-lwp-protocol-https \
    rust && \
  npm install -g yaml-language-server && \
  cargo install stylua

ENV PATH "$PATH:/root/.cargo/bin"

WORKDIR /
