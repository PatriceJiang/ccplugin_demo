cmake_minimum_required(VERSION 3.8)

project(AES CXX)

set(CMAKE_CXX_STANDARD 17)

add_library(AES src/AES.cpp)

target_include_directories(AES PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

set_target_properties(AES PROPERTIES
    PUBLIC_HEADER include/AES.h
)

install(TARGETS AES
    LIBRARY DESTINATION lib
    PUBLIC_HEADER DESTINATION include
)

# ############## glue

# include cocos-engine
set(COCOS_X_PATH i:/Github/editor-3d/resources/3d/engine/native)
include(i:/Github/editor-3d/resources/3d/engine/native/CMakeLists.txt)

add_library(aes_glue STATIC glue/aes-glue.cpp)
target_link_libraries(aes_glue PUBLIC
    AES
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