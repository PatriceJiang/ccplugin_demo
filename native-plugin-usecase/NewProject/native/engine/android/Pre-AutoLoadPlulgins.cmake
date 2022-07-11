# plugins found & enabled in search path


set(aes_glue_ROOT
   "${CC_PROJECT_DIR}/../../plugins/aes/android/${ANDROID_ABI}"
   "${CC_PROJECT_DIR}/../../plugins/aes/android"
)

list(APPEND CMAKE_FIND_ROOT_PATH ${aes_glue_ROOT})
list(APPEND CC_REGISTERED_PLUGINS
  aes_glue
)

find_package(aes
  REQUIRED
  NAMES "aes"
  PATHS
    "${CC_PROJECT_DIR}/../../plugins/aes/android/${ANDROID_ABI}"
    "${CC_PROJECT_DIR}/../../plugins/aes/android"
  NO_DEFAULT_PATH
)

find_package(aes_glue
  REQUIRED
  NAMES "aes_glue"
  PATHS
    "${CC_PROJECT_DIR}/../../plugins/aes/android/${ANDROID_ABI}"
    "${CC_PROJECT_DIR}/../../plugins/aes/android"
  NO_DEFAULT_PATH
)
