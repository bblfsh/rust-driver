# Config
VERSION ?=
DOCKER_IMAGE ?=
DOCKER_BUILD_IMAGE ?= $(DOCKER_IMAGE)-build
VOLUME_PATH ?= $(shell pwd)

# Docker
DOCKER_CMD ?= docker
DOCKER_BUILD ?= $(DOCKER_CMD) build
DOCKER_RUN ?= $(DOCKER_CMD) run --rm
DOCKER_PUSH ?= $(DOCKER_CMD) push
DOCKER_FILE ?= Dockerfile
DOCKER_FILE_BUILD ?= Dockerfile.build
VOLUME_TARGET ?= /opt/driver

# Enviroments
BUILD_ARGS ?= --build-arg VERSION=$(VERSION)
BUILD_CMD ?= $(DOCKER_RUN) -v $(VOLUME_PATH):$(VOLUME_TARGET) $(DOCKER_BUILD_IMAGE)

# Rules
all: build

$(DOCKER_BUILD_IMAGE):
	$(DOCKER_BUILD) -f $(DOCKER_FILE_BUILD) $(BUILD_ARGS) -t $@  .

test: $(DOCKER_BUILD_IMAGE)
	$(BUILD_CMD) make test-native

build: $(DOCKER_BUILD_IMAGE)
	$(BUILD_CMD) make build-native; \
    $(DOCKER_BUILD) -f $(DOCKER_FILE) $(BUILD_ARGS) -t $(DOCKER_IMAGE):$(VERSION) .

push: build
	$(DOCKER_PUSH) $(DOCKER_IMAGE):$(VERSION)