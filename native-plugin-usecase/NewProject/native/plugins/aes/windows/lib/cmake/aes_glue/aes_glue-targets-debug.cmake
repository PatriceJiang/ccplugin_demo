#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "aes_glue" for configuration "Debug"
set_property(TARGET aes_glue APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(aes_glue PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/aes_glued.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS aes_glue )
list(APPEND _IMPORT_CHECK_FILES_FOR_aes_glue "${_IMPORT_PREFIX}/lib/aes_glued.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
