FROM ghcr.io/someone-stole-my-name/docker-nvim:0.8.0

RUN apk --no-cache add \
    cargo \
    npm \
    perl \
    perl-json-xs \
    perl-lwp-protocol-https \
    python3 \
    rust \
    wget

# install the same version that packer would
RUN wget -nv https://raw.githubusercontent.com/luarocks/hererocks/latest/hererocks.py && \
  mkdir -p /root/.cache/nvim/packer_hererocks/2.1.0-beta3 && \
  python hererocks.py --verbose -j 2.1.0-beta3 -r latest --cflags="-DLUAJIT_ENABLE_GC64" /root/.cache/nvim/packer_hererocks/2.1.0-beta3

RUN npm install -g yaml-language-server

RUN cargo install stylua

ENV PATH "$PATH:/root/.cargo/bin"
ENV SHELL "ash"

WORKDIR /
