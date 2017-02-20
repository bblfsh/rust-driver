FROM debian:jessie
MAINTAINER src-d

ENV DEBIAN_FRONTEND=noninteractive

ADD https://static.rust-lang.org/rustup.sh rustup.sh

RUN apt-get update && \
    apt-get install \
       ca-certificates \
       curl \
       sudo \
       gcc \
       file \
       libc6-dev \
       -qqy \
       --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN sh rustup.sh --channel=nightly

RUN mkdir -p /opt/rust
ADD . /opt/rust
WORKDIR /opt/rust
RUN cargo install && \
        cargo build --release
CMD $HOME/.cargo/bin/rust-parser
