# Copyright Abel Sinkovics (abel@sinkovics.hu)  2013.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

# Options for the module
#  CLANG_INCLUDEDIR   Set this if the module can not find the Readline
#                     headers
#  CLANG_LIBRARYDIR   Set this if the module can not find the Readline
#                     library
#  CLANG_DEBUG        Set this for verbose output
#
# This module will define the following:
#   CLANG_FOUND
#   CLANG_INCLUDE_DIR
#   CLANG_LIBRARY

if (NOT $ENV{CLANG_INCLUDEDIR} STREQUAL "" )
  set(CLANG_INCLUDEDIR $ENV{CLANG_INCLUDEDIR})
endif()

if (NOT $ENV{CLANG_LIBRARYDIR} STREQUAL "" )
  set(CLANG_LIBRARYDIR $ENV{CLANG_LIBRARYDIR})
endif()

# Find clang-c on Ubuntu 13.10
foreach(V 3.4 3.3 3.2)
  set(CLANG_INCLUDEDIR "${CLANG_INCLUDEDIR};/usr/lib/llvm-${V}/include")
endforeach()

if (CLANG_DEBUG)
  message(STATUS "[${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}]")
  message(STATUS "Searching for libclang")
  message(STATUS "  CLANG_INCLUDEDIR = ${CLANG_INCLUDEDIR}")
endif()

find_path(CLANG_INCLUDE_DIR NAMES clang-c/Index.h HINTS ${CLANG_INCLUDEDIR})

set(CLANG_LIBRARYDIR "${CLANG_LIBRARYDIR};${CLANG_INCLUDE_DIR}/../lib")

if (CLANG_DEBUG)
  message(STATUS "  CLANG_LIBRARYDIR = ${CLANG_LIBRARYDIR}")
endif()

find_library(CLANG_LIBRARY NAMES clang HINTS ${CLANG_LIBRARYDIR})

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set CLANG_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
  CLANG DEFAULT_MSG CLANG_LIBRARY CLANG_INCLUDE_DIR
)

mark_as_advanced(CLANG_INCLUDE_DIR, CLANG_LIBRARY)

if (CLANG_DEBUG)
  message(STATUS "[${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}]")
  if (CLANG_FOUND)
    message(STATUS "libclang found")
    message(STATUS "  CLANG_INCLUDE_DIR = ${CLANG_INCLUDE_DIR}")
    message(STATUS "  CLANG_LIBRARY = ${CLANG_LIBRARY}")
  else()
    message(STATUS "libclang not found")
  endif()
  message(STATUS "[${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}]")
endif()

