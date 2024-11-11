#!/bin/bash

# Configure and build the CMake project

# Check if the "build" directory exists
if [ ! -d "build" ]; then
  mkdir build
fi

cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
cmake --build .