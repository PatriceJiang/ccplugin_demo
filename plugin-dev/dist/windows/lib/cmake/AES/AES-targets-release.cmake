#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "AES" for configuration "Release"
set_property(TARGET AES APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(AES PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/AES.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS AES )
list(APPEND _IMPORT_CHECK_FILES_FOR_AES "${_IMPORT_PREFIX}/lib/AES.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
