set(_LIB_AES_ROOT ${CMAKE_CURRENT_LIST_DIR}/../../..)


add_library(aes STATIC IMPORTED GLOBAL)

set_target_properties(aes PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${_LIB_AES_ROOT}/include"
    IMPORTED_LOCATION "${_LIB_AES_ROOT}/lib/libAES.a"
)