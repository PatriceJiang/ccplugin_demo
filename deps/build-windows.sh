#!/bin/bash

set -x
set -e
rm -rf build-windows
rm -rf dist/windows
cmake -B build-windows \
    -DCMAKE_INSTALL_PREFIX=dist/windows 

cmake --build build-windows --config Release --target install

