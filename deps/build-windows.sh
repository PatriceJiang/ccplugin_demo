#!/bin/bash

set -x
set -e
rm -rf build-windows
rm -rf dist/windows
cmake -B build-windows \
    -DCMAKE_INSTALL_PREFIX=dist/windows \
    -DCMAKE_DEBUG_POSTFIX=d

cmake --build build-windows --config Release --target install
cmake --build build-windows --config Debug --target install

