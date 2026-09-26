# Locate FAAC while keeping the header and library from the same installation.
#
# Faac_INCLUDE_DIR - directory containing faac.h
# Faac_LIBRARIES   - FAAC library
# Faac_FOUND       - whether both were found

set(Faac_NAMES faac_drm faac)
if(APPLE)
  # Homebrew FAAC 2.1 currently hides its encoder API in the dylib but exports
  # it from the static archive.
  set(_Faac_ORIG_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
  set(CMAKE_FIND_LIBRARY_SUFFIXES .a)
endif()
find_library(Faac_LIBRARY NAMES ${Faac_NAMES} HINTS ENV FAAC_ROOT
             PATH_SUFFIXES lib)
if(APPLE)
  set(CMAKE_FIND_LIBRARY_SUFFIXES ${_Faac_ORIG_SUFFIXES})
endif()

if(Faac_LIBRARY)
  get_filename_component(_Faac_REAL_LIBRARY "${Faac_LIBRARY}" REALPATH)
  get_filename_component(_Faac_LIBDIR "${_Faac_REAL_LIBRARY}" DIRECTORY)
  get_filename_component(_Faac_PREFIX "${_Faac_LIBDIR}" DIRECTORY)
  find_path(Faac_INCLUDE_DIR faac.h HINTS "${_Faac_PREFIX}/include"
            NO_DEFAULT_PATH)
endif()
find_path(Faac_INCLUDE_DIR faac.h HINTS ENV FAAC_ROOT PATH_SUFFIXES include)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Faac REQUIRED_VARS Faac_LIBRARY Faac_INCLUDE_DIR)
set(Faac_LIBRARIES ${Faac_LIBRARY})
mark_as_advanced(Faac_LIBRARY Faac_INCLUDE_DIR)
