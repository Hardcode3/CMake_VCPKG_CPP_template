FROM ubuntu:latest

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Install required system packages
RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    clang-format \
    lldb \
    lld \
    cmake \
    git \
    curl zip unzip tar \
    wget \
    ninja-build \
    doxygen \
    graphviz \
    pkg-config \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install vcpkg
WORKDIR /usr/local
RUN git clone https://github.com/microsoft/vcpkg.git
WORKDIR /usr/local/vcpkg
RUN ./bootstrap-vcpkg.sh
ENV PATH="/usr/local/vcpkg:${PATH}"

# Set VCPKG_ROOT environment variable
ENV VCPKG_ROOT=/usr/local/vcpkg
ENV PATH="${VCPKG_ROOT}:${PATH}"
ENV VCPKG_INSTALLED_DIR="${VCPKG_ROOT}/installed"

# Test the vcpkg and compiler setup by installing fmt lib
RUN vcpkg install fmt

# Set up a user and working directory for development
WORKDIR /home/devuser
RUN git clone https://github.com/Hardcode3/CMake_VCPKG_CPP_template.git
WORKDIR /home/devuser/CMake_VCPKG_CPP_template/
RUN sh .dev/build.sh
WORKDIR /home/devuser

# Entry point to keep the container alive for development
CMD [ "bash" ]