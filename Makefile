RUSTUP_CMD := rustup run $(RUNTIME_NATIVE_VERSION)
CARGO_CMD := $(RUSTUP_CMD) cargo

test-native:
	cd native; \
	$(CARGO_CMD) test

build-native:
	cd native; \
	$(CARGO_CMD) install; \
	$(CARGO_CMD) build --release

include .sdk/Makefile