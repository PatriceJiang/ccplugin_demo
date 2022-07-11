#!/bin/bash
set -x
set -e

rm -rf build-mac
rm -rf dist/mac

for arch in arm64 x86_64
do
cmake -GNinja \
    -B build-mac/$arch \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=10.15 \
    -DCMAKE_INSTALL_PREFIX=build-mac/install/$arch \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_OSX_ARCHITECTURES=$arch
ninja -C build-mac/$arch install
done

mkdir -p dist/mac/include dist/mac/lib
cp -rv build-mac/install/x86_64/include/* dist/mac/include
xcrun lipo -create \
    build-mac/install/arm64/lib/libAES.a \
    build-mac/install/x86_64/lib/libAES.a \
    -output \
    dist/mac/lib/libAES.a 

find dist/mac -name "*.a" -exec xcrun strip -S {} \;
