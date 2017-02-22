# Config
DOCKER_IMAGE := bblfsh/rust-driver
VERSION := nightly-2017-02-20

# Rust
RUSTUP_CMD := rustup run $(VERSION)
CARGO_CMD := $(RUSTUP_CMD) cargo

test-native:
	cd native; \
	$(CARGO_CMD) test

build-native:
	cd native; \
	$(CARGO_CMD) install; \
    $(CARGO_CMD) build --release

-include .sdk/Makefile