# Copyright Abel Sinkovics (abel@sinkovics.hu)  2013.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

# Options for the module
#  READLINE_INCLUDEDIR   Set this if the module can not find the Readline
#                        headers
#  READLINE_LIBRARYDIR   Set this if the module can not find the Readline
#                        library
#  READLINE_DEBUG        Set this for verbose output
#
# This module will define the following:
#   READLINE_FOUND
#   READLINE_INCLUDE_DIR
#   READLINE_LIBRARY

if (NOT $ENV{READLINE_INCLUDEDIR} STREQUAL "" )
  set(READLINE_INCLUDEDIR $ENV{READLINE_INCLUDEDIR})
endif()

if (NOT $ENV{READLINE_LIBRARYDIR} STREQUAL "" )
  set(READLINE_LIBRARYDIR $ENV{READLINE_LIBRARYDIR})
endif()

if (READLINE_DEBUG)
  message(STATUS "[${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}]")
  message(STATUS "Searching for Readline")
  message(STATUS "  READLINE_INCLUDEDIR = ${READLINE_INCLUDEDIR}")
  message(STATUS "  READLINE_LIBRARYDIR = ${READLINE_LIBRARYDIR}")
endif()

find_path(
  READLINE_INCLUDE_DIR
  NAMES readline/readline.h
  HINTS ${READLINE_INCLUDEDIR}
)
find_library(
  READLINE_LIBRARY
  NAMES readline
  HINTS ${READLINE_LIBRARYDIR}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set READLINE_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(
  Readline DEFAULT_MSG READLINE_LIBRARY READLINE_INCLUDE_DIR
)

mark_as_advanced(READLINE_INCLUDE_DIR, READLINE_LIBRARY)

if (READLINE_DEBUG)
  message(STATUS "[${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}]")
  if (READLINE_FOUND)
    message(STATUS "Readline found")
    message(STATUS "  READLINE_INCLUDE_DIR = ${READLINE_INCLUDE_DIR}")
    message(STATUS "  READLINE_LIBRARY = ${READLINE_LIBRARY}")
  else()
    message(STATUS "Readline not found")
  endif()
  message(STATUS "[${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}]")
endif()


