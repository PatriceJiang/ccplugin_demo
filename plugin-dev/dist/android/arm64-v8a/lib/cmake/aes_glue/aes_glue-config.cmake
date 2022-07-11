set(_LIB_AES_GLUE_ROOT ${CMAKE_CURRENT_LIST_DIR}/../../..)


add_library(aes_glue STATIC IMPORTED GLOBAL)

set_target_properties(aes_glue PROPERTIES
    IMPORTED_LOCATION "${_LIB_AES_GLUE_ROOT}/lib/libaes_glue.a"
    INTERFACE_LINK_LIBRARIES "aes"
)