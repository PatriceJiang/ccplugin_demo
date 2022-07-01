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

include(GNUInstallDirs)
install(TARGETS AES
    PUBLIC_HEADER
    )

install(TARGETS AES
    EXPORT aes-targets
    #ARCHIVE DESTINATION lib/cmake/aes
    )
install(EXPORT aes-targets
    FILE aes-targets.cmake
    DESTINATION lib/cmake/aes
)

include(CMakePackageConfigHelpers)

configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/Config-aes.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/aes-config.cmake
    INSTALL_DESTINATION "lib/cmake/aes"
    NO_SET_AND_CHECK_MACRO
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
    )

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/aes-config.cmake
    DESTINATION lib/cmake/aes
    )


############### glue

# include cocos-engine
include(i:/Github/editor-3d/resources/3d/engine/native/CMakeLists.txt)

add_library(aes_glue STATIC glue/aes-glue.cpp)
target_link_libraries(aes_glue PUBLIC
    AES
    $<BUILD_INTERFACE:cocos_engine>
)
install(TARGETS aes_glue
    EXPORT aes_glue-targets
    #ARCHIVE DESTINATION lib/cmake/aes_glue
    )
install(EXPORT aes_glue-targets
    FILE aes_glue-targets.cmake
    DESTINATION lib/cmake/aes_glue
)

include(CMakePackageConfigHelpers)

configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/aes_glue-config.cmake
    INSTALL_DESTINATION "lib/cmake/aes_glue"
    NO_SET_AND_CHECK_MACRO
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
    )

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/aes_glue-config.cmake
    DESTINATION lib/cmake/aes_glue
    )


