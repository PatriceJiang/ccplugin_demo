cmake_minimum_required(VERSION 3.8)


project(AES CXX)

set(CMAKE_CXX_STANDARD 17)

add_library(AES src/AES.cpp)

target_include_directories(AES PRIVATE
    include)

set_target_properties(AES PROPERTIES
    PUBLIC_HEADER include/AES.h)
include(GNUInstallDirs)
install(TARGETS AES
    PUBLIC_HEADER)

