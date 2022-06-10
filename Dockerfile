#FROM paritytech/ci-linux:production
FROM ubuntu:latest

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    clang \
    cmake \
    curl \
    git \
    libssl-dev \
    pkg-config

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN bash -c 'source $HOME/.cargo/env' && \
    export PATH=$PATH:$HOME/.cargo/bin && \
    rustup default stable && \
    rustup toolchain install nightly && \	
    rustup target add wasm32-unknown-unknown --toolchain nightly 

ENTRYPOINT ["/entrypoint.sh"]
