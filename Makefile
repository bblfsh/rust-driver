include .sdk/Makefile

RUSTUP_CMD := rustup run $(RUNTIME_NATIVE_VERSION)
CARGO_CMD := $(RUSTUP_CMD) cargo

test-native-internal:
	$(header)
	cd native; \
	$(CARGO_CMD) test

build-native-internal:
	$(header)
	cd native; \
	$(CARGO_CMD) install; \
	$(CARGO_CMD) build --release; \
	cp target/release/rust-parser $(BUILD_PATH)/native