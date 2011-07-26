# - Try to find the fcitx4 library
# Once done this will define
#
# FCITX4_FCITX_FOUND
# FCITX4_FCITX_LIBRARIES
# FCITX4_FCITX_LIBRARY_DIRS
# FCITX4_FCITX_LDFLAGS
# FCITX4_FCITX_LDFLAGS_OTHER
# FCITX4_FCITX_INCLUDE_DIRS
# FCITX4_FCITX_CFLAGS
# FCITX4_FCITX_CFLAGS_OTHER

# FCITX4_FCITX_CONFIG_FOUND
# FCITX4_FCITX_CONFIG_LIBRARIES
# FCITX4_FCITX_CONFIG_LIBRARY_DIRS
# FCITX4_FCITX_CONFIG_LDFLAGS
# FCITX4_FCITX_CONFIG_LDFLAGS_OTHER
# FCITX4_FCITX_CONFIG_INCLUDE_DIRS
# FCITX4_FCITX_CONFIG_CFLAGS
# FCITX4_FCITX_CONFIG_CFLAGS_OTHER
#
# FCITX4_FCITX_UTILS_FOUND
# FCITX4_FCITX_UTILS_LIBRARIES
# FCITX4_FCITX_UTILS_LIBRARY_DIRS
# FCITX4_FCITX_UTILS_LDFLAGS
# FCITX4_FCITX_UTILS_LDFLAGS_OTHER
# FCITX4_FCITX_UTILS_INCLUDE_DIRS
# FCITX4_FCITX_UTILS_CFLAGS
# FCITX4_FCITX_UTILS_CFLAGS_OTHER
#
# FCITX4_ADDON_INSTALL_DIR
# FCITX4_CONFIGDESC_INSTALL_DIR
# FCITX4_ADDON_CONFIG_INSTALL_DIR
# FCITX4_PACKAGE_NAME
# FCITX4_VERSION
#
#==============================================================================
# Copyright 2011 Xuetian Weng
#
# Distributed under the GPLv2 License
# see accompanying file COPYRIGHT for details
#==============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

# use pkg-config to get the directories and then use these values
# in the FIND_PATH() and FIND_LIBRARY() calls
FIND_PACKAGE(PkgConfig)
PKG_CHECK_MODULES(PC_FCITX fcitx QUIET)
PKG_CHECK_MODULES(PC_FCITX_CONFIG fcitx-config QUIET)
PKG_CHECK_MODULES(PC_FCITX_UTILS fcitx-utils QUIET)

SET(FCITX4_FCITX_FOUND ${PC_FCITX_FOUND})
SET(FCITX4_FCITX_LIBRARIES ${PC_FCITX_LIBRARIES})
SET(FCITX4_FCITX_LIBRARY_DIRS ${PC_FCITX_LIBRARY_DIRS})
SET(FCITX4_FCITX_LDFLAGS ${PC_FCITX_LDFLAGS})
SET(FCITX4_FCITX_LDFLAGS_OTHER ${PC_FCITX_LDFLAGS_OTHER})
SET(FCITX4_FCITX_INCLUDE_DIRS ${PC_FCITX_INCLUDE_DIRS})
SET(FCITX4_FCITX_CFLAGS ${PC_FCITX_CFLAGS})
SET(FCITX4_FCITX_CFLAGS_OTHER ${PC_FCITX_CFLAGS_OTHER})

SET(FCITX4_FCITX_CONFIG_FOUND ${PC_FCITX_FOUND})
SET(FCITX4_FCITX_CONFIG_LIBRARIES ${PC_FCITX_CONFIG_LIBRARIES})
SET(FCITX4_FCITX_CONFIG_LIBRARY_DIRS ${PC_FCITX_CONFIG_LIBRARY_DIRS})
SET(FCITX4_FCITX_CONFIG_LDFLAGS ${PC_FCITX_CONFIG_LDFLAGS})
SET(FCITX4_FCITX_CONFIG_LDFLAGS_OTHER ${PC_FCITX_CONFIG_LDFLAGS_OTHER})
SET(FCITX4_FCITX_CONFIG_INCLUDE_DIRS ${PC_FCITX_CONFIG_INCLUDE_DIRS})
SET(FCITX4_FCITX_CONFIG_CFLAGS ${PC_FCITX_CONFIG_CFLAGS})
SET(FCITX4_FCITX_CONFIG_CFLAGS_OTHER ${PC_FCITX_CONFIG_CFLAGS_OTHER})

SET(FCITX4_FCITX_UTILS_FOUND ${PC_FCITX_FOUND})
SET(FCITX4_FCITX_UTILS_LIBRARIES ${PC_FCITX_UTILS_LIBRARIES})
SET(FCITX4_FCITX_UTILS_LIBRARY_DIRS ${PC_FCITX_UTILS_LIBRARY_DIRS})
SET(FCITX4_FCITX_UTILS_LDFLAGS ${PC_FCITX_UTILS_LDFLAGS})
SET(FCITX4_FCITX_UTILS_LDFLAGS_OTHER ${PC_FCITX_UTILS_LDFLAGS_OTHER})
SET(FCITX4_FCITX_UTILS_INCLUDE_DIRS ${PC_FCITX_UTILS_INCLUDE_DIRS})
SET(FCITX4_FCITX_UTILS_CFLAGS ${PC_FCITX_UTILS_CFLAGS})
SET(FCITX4_FCITX_UTILS_CFLAGS_OTHER ${PC_FCITX_UTILS_CFLAGS_OTHER})

FIND_PROGRAM(FCITX4_FCITXCONFIG_EXECUTABLE NAMES fcitx4-config
   # the suffix must be used since KDEDIRS can be a list of directories which don't have bin/ appended
   PATH_SUFFIXES bin
   HINTS
   ${CMAKE_INSTALL_PREFIX}
   /opt/fcitx
   ONLY_CMAKE_FIND_ROOT_PATH
   )

IF(FCITX4_FCITXCONFIG_EXECUTABLE)
    message(STATUS "fcitx4-config found ${FCITX4_FCITXCONFIG_EXECUTABLE}")
    EXECUTE_PROCESS(COMMAND "${FCITX4_FCITXCONFIG_EXECUTABLE}" --addondir OUTPUT_VARIABLE FCITX4_ADDON_INSTALL_DIR ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
    EXECUTE_PROCESS(COMMAND "${FCITX4_FCITXCONFIG_EXECUTABLE}" --configdescdir OUTPUT_VARIABLE FCITX4_CONFIGDESC_INSTALL_DIR ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
    EXECUTE_PROCESS(COMMAND "${FCITX4_FCITXCONFIG_EXECUTABLE}" --addonconfigdir OUTPUT_VARIABLE FCITX4_ADDON_CONFIG_INSTALL_DIR ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
    EXECUTE_PROCESS(COMMAND "${FCITX4_FCITXCONFIG_EXECUTABLE}" --package OUTPUT_VARIABLE FCITX4_PACKAGE_NAME ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
    EXECUTE_PROCESS(COMMAND "${FCITX4_FCITXCONFIG_EXECUTABLE}" --version OUTPUT_VARIABLE FCITX4_VERSION ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
else(FCITX4_FCITXCONFIG_EXECUTABLE)
    message(STATUS "fcitx4-config not found")
ENDIF(FCITX4_FCITXCONFIG_EXECUTABLE)

set(_FCITX4_REQUIRED_VARS FCITX4_VERSION)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Fcitx4  REQUIRED_VARS  ${_FCITX4_REQUIRED_VARS}
                                        VERSION_VAR FCITX4_VERSION )

INCLUDE(FcitxMacro)
