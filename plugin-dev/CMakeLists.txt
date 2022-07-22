cmake_minimum_required(VERSION 3.8)

project(hello_cocos-GLUE CXX)

set(CMAKE_CXX_STANDARD 17)
###################### target: aes

add_library(hello_cocos src/hello_cocos.cpp)

target_include_directories(hello_cocos PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/include
)

# set_target_properties(aes PROPERTIES
#     PUBLIC_HEADER aes/include/AES.h
# )

install(TARGETS hello_cocos
    LIBRARY DESTINATION lib
    # PUBLIC_HEADER DESTINATION include
)

###################### target: aes_glue

# include cocos-engine, replace with engine path
#set(COCOS_X_PATH i:/Github/editor-3d/resources/3d/engine/native)
set(COCOS_X_PATH /Volumes/Removable/Github/editor-3d/resources/3d/engine/native)
include(${COCOS_X_PATH}/CMakeLists.txt)


add_library(hello_cocos_glue STATIC src/hello_cocos-glue.cpp)


target_link_libraries(hello_cocos_glue PUBLIC
    hello_cocos
)
target_link_libraries(hello_cocos_glue PRIVATE
    $<BUILD_INTERFACE:cocos_engine> # do not export to install
)

install(TARGETS hello_cocos_glue
    LIBRARY DESTINATION lib
)

