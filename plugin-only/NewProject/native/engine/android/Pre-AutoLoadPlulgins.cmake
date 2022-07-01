# plugins found & enabled in search path

# auto generated, disable update by appending "set(SKIP_SCAN_PLUGINS ON)" in cfg.cmake

#if(POLICY CMP0074)
#  cmake_policy(SET CMP0074 NEW)
#endif()


set(aes_glue_ROOT
   "${CC_PROJECT_DIR}/../../plugins/aes/android/${ANDROID_ABI}"
#   "${CC_PROJECT_DIR}/../../plugins/aes/android"
)

set(AES_ROOT ${aes_glue_ROOT})

list(APPEND CMAKE_FIND_ROOT_PATH ${aes_glue_ROOT})
list(APPEND CC_REGISTERED_PLUGINS
  aes_glue
)

find_package(AES
  REQUIRED
  NAMES "AES"
  PATHS
    "${CC_PROJECT_DIR}/../../plugins/aes/android/${ANDROID_ABI}"
#    "${CC_PROJECT_DIR}/../../plugins/aes/android"
# NO_DEFAULT_PATH
        NO_SYSTEM_ENVIRONMENT_PATH
        NO_CMAKE_SYSTEM_PATH
        # ONLY_CMAKE_FIND_ROOT_PATH
       CMAKE_FIND_ROOT_PATH_BOTH
#        NO_PACKAGE_ROOT_PATH
        )

find_package(aes_glue
  REQUIRED
  NAMES "aes_glue"
  PATHS
    "${CC_PROJECT_DIR}/../../plugins/aes/android/${ANDROID_ABI}"
    "${CC_PROJECT_DIR}/../../plugins/aes/android"
  NO_DEFAULT_PATH
)
