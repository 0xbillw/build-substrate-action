FROM paritytech/ci-linux:production

COPY entrypoint.sh /entrypoint.sh

RUN apt update && apt install -y git clang curl libssl-dev llvm libudev-dev && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.sh"]
