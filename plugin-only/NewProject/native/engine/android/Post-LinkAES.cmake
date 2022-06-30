
set(DIST_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../../../deps/dist")


add_library(AES STATIC IMPORTED GLOBAL)

set_target_properties(AES PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${DIST_DIR}/android/${ANDROID_ABI}/include"
    IMPORTED_LOCATION "${DIST_DIR}/android/${ANDROID_ABI}/lib/libAES.a"
)

target_link_libraries(${CC_TARGET_NAME} AES)