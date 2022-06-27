#!/bin/bash
set -x
set -e

rm -rf build-ios
rm -rf dist/ios


cmake -GNinja \
    -B build-ios/arm64 \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=11 \
    -DCMAKE_INSTALL_PREFIX=build-ios/install/arm64 \
    -DCMAKE_SYSTEM_NAME=iOS \
    -DCMAKE_OSX_SYSROOT=iphoneos \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_OSX_ARCHITECTURES=arm64
ninja -C build-ios/arm64 install

cmake -GNinja \
    -B build-ios/x86_64 \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=11 \
    -DCMAKE_INSTALL_PREFIX=build-ios/install/x86_64 \
    -DCMAKE_SYSTEM_NAME=iOS \
    -DCMAKE_OSX_SYSROOT=iphonesimulator \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_OSX_ARCHITECTURES=x86_64
ninja -C build-ios/x86_64 install

mkdir -p dist/ios/include dist/ios/lib
cp -rv build-ios/install/arm64/include/* dist/ios/include/ 
xcrun lipo -create \
    build-ios/install/arm64/lib/libAES.a \
    build-ios/install/x86_64/lib/libAES.a \
    -output \
    dist/ios/lib/libAES.a
xcrun strip -S `find build-ios -name "*AES.a"`
