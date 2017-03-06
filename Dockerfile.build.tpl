# Dockerfile.build represents the build environment of the driver, used during
# the development phase to test and in CI to build and test.

# The prefered base image is the lastest stable Alpine image, if alpine doesn't
# meet the requirements you can switch the from to the latest stable slim
# version of Debian (eg.: `debian:jessie-slim`).
FROM debian:jessie-slim

# To avoid files written in the volume by root or foreign users, we create a
# container local user with the same UID of the user executing the build.
# The following commands are defined to use in busybox based distributions,
# if you are using a standard distributions, replace the `adduser` command with:
#   `useradd --uid ${BUILD_UID} --home /opt/driver ${BUILD_USER}`
RUN mkdir -p /opt/driver/src && \
    useradd --uid ${BUILD_UID} --home /opt/driver ${BUILD_USER}


# As minimal build tools you need: make, curl and git, install using the same
# command the specific tools required to build the driver.
RUN apt update && \
    apt install -y --no-install-recommends make git curl ca-certificates


# The volume with the full source code is mounted at `/opt/driver/src` so, we
# set the workdir to this path.
WORKDIR /opt/driver/src