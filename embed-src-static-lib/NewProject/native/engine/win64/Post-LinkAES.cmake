
set(DIST_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../../../deps/dist")


add_library(AES STATIC IMPORTED GLOBAL)

set_target_properties(AES PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${DIST_DIR}/windows/include"
    IMPORTED_LOCATION_RELEASE "${DIST_DIR}/windows/lib/AES.lib"
    IMPORTED_LOCATION_DEBUG "${DIST_DIR}/windows/lib/AESd.lib"
)

target_link_libraries(${CC_TARGET_NAME} AES)