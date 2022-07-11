cmake_minimum_required(VERSION 3.8)

project(AES CXX)

set(CMAKE_CXX_STANDARD 17)
###################### target: aes

add_library(aes aes/src/AES.cpp)

target_include_directories(aes PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/aes/include
)

set_target_properties(aes PROPERTIES
    PUBLIC_HEADER aes/include/AES.h
)

install(TARGETS aes
    LIBRARY DESTINATION lib
    PUBLIC_HEADER DESTINATION include
)

###################### target: aes_glue

# include cocos-engine, replace with engine path
set(COCOS_X_PATH i:/Github/editor-3d/resources/3d/engine/native)
include(${COCOS_X_PATH}/CMakeLists.txt)


add_library(aes_glue STATIC aes_glue/src/aes-glue.cpp)


target_link_libraries(aes_glue PUBLIC
    aes
)
target_link_libraries(aes_glue PRIVATE
    $<BUILD_INTERFACE:cocos_engine> # do not export to install
)

install(TARGETS aes_glue
    LIBRARY DESTINATION lib
)