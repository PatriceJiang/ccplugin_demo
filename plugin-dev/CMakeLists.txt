cmake_minimum_required(VERSION 3.8)

project(AES CXX)

set(CMAKE_CXX_STANDARD 17)

add_library(aes aes/src/AES.cpp)

target_include_directories(aes PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/aes/include>
    $<INSTALL_INTERFACE:aes/include/include>
)

set_target_properties(aes PROPERTIES
    PUBLIC_HEADER aes/include/AES.h
)

install(TARGETS aes
    LIBRARY DESTINATION lib
    PUBLIC_HEADER DESTINATION include
)

# ############## glue

# include cocos-engine
set(COCOS_X_PATH i:/Github/editor-3d/resources/3d/engine/native)
include(i:/Github/editor-3d/resources/3d/engine/native/CMakeLists.txt)

add_library(aes_glue STATIC aes_glue/src/aes-glue.cpp)
target_link_libraries(aes_glue PUBLIC
    aes
)
target_link_libraries(aes_glue INTERFACE
    $<BUILD_INTERFACE:cocos_engine>
)

get_target_property(COCOS_INCLUDES cocos_engine INCLUDE_DIRECTORIES)
target_include_directories(aes_glue PRIVATE
    ${COCOS_INCLUDES}
)

install(TARGETS aes_glue
    LIBRARY DESTINATION lib
)