cmake_minimum_required(VERSION 3.8)


project(AES CXX)

set(CMAKE_CXX_STANDARD 17)


if("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
    add_library(AES SHARED src/AES.cpp)
else()
    add_library(AES src/AES.cpp)
endif()

target_include_directories(AES PRIVATE
    include)

set_target_properties(AES PROPERTIES
    PUBLIC_HEADER include/AES.h)
include(GNUInstallDirs)
install(TARGETS AES
    PUBLIC_HEADER)

