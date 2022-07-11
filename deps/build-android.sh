#!/bin/bash
set -x
set -e

if [ $# -ne 0 ]; then
    ndk_path=$1
elif [ -n "$ANDROID_NDK_HOME" ]; then
    ndk_path=$ANDROID_NDK_HOME
elif [ -n "$ANDROID_NDK_ROOT" ]; then
    ndk_path=$ANDROID_NDK_ROOT
elif [ -n "$NDK_ROOT" ]; then
    ndk_path=$NDK_ROOT
else
    echo "Cannot find NDK root path"
    exit 1
fi

GENERATER="Ninja"
if [ -x "$(command -v ninja)" ]; then
    MAKE_BIN=-DCMAKE_MAKE_PROGRAM="$(command -v ninja)"
else
    echo "Ninja is not find, use 'make' instead."
    GENERATER="Unix Makefiles"
    MAKE_BIN=""
fi

#rm -rf build-android
rm -rf dist/android

#for arch in armeabi-v7a arm64-v8a x86 x86_64 
#do
#mkdir -p build-android/$arch
#cmake -S. -Bbuild-android/$arch \
#    -DCMAKE_TOOLCHAIN_FILE="$ndk_path/build/cmake/android.toolchain.cmake" \
#    -DANDROID_PLATFORM=android-21 \
#    -DANDROID_ABI=$arch \
#    -DCMAKE_BUILD_TYPE=Debug \
#    -DCMAKE_INSTALL_PREFIX=dist/android/$arch \
#    -DCMAKE_DEBUG_POSTFIX=d \
#    -G "$GENERATER" $MAKE_BIN 
#
#cmake --build build-android/$arch --target install
#
#done

for arch in armeabi-v7a arm64-v8a x86 x86_64 
do
## compile libraries
mkdir -p build-android/$arch
cmake -S. -Bbuild-android/$arch \
    -DCMAKE_TOOLCHAIN_FILE="$ndk_path/build/cmake/android.toolchain.cmake" \
    -DANDROID_PLATFORM=android-21 \
    -DANDROID_ABI=$arch \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=dist/android/$arch \
    -DCMAKE_DEBUG_POSTFIX=d \
    -DUSE_CCACHE=ON \
    -G "$GENERATER" $MAKE_BIN 

## install headers & static libraries
cmake --build build-android/$arch --target install

## copy <PackageName>-config.cmake
mkdir -p dist/android/$arch/lib/cmake/aes_glue
mkdir -p dist/android/$arch/lib/cmake/aes
cp android-aes_glue-config.cmake  dist/android/$arch/lib/cmake/aes_glue/aes_glue-config.cmake
cp android-aes-config.cmake  dist/android/$arch/lib/cmake/aes/aes-config.cmake

done

## strip static libraries

if [[ "$OSTYPE" == "darwin"* ]]; then
    find build-android -name "*.a" -exec $ndk_path/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-strip -S {} \;
elif [[ "$OSTYPE" == "msys" ]]; then
    find build-android -name "*.a" -exec $ndk_path/toolchains/llvm/prebuilt/windows-x86_64/bin/llvm-strip.exe -S {} \;
else
    echo "skip strip archives"
fi
