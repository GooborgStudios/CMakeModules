##########
#
### Nightwave Studios' Find Module Template
# 
# When creating a new find module to add to this repository, use the following format.
# Replace "TemplateLib" with the name of the library.
# Replace "TEMPLATE_LIB" with the name of the library in all caps, using underscores as appropriate.
# Update paths and files to look for as appropriate.
# If the library has multiple parts (i.e. how GraphicsMagick has Magick, Magick++, and MagickWand), copy the calls and modify message as appropriate.
#
# Make sure to remove these top thirteen lines before submitting a PR!
#
##########

# -*-cmake-*-
#
# Nightwave Studios - FindTemplateLib.cmake
# https://www.nightwave.co
#
# Search for TemplateLib library files
# Format based off of https://github.com/buaazp/zimg/blob/master/src/CMakeModules/FindGraphicsMagick.cmake
#
# Once loaded this will define:
#   TEMPLATE_LIB_FOUND       - system has TemplateLib
#   TEMPLATE_LIB_INCLUDE_DIR - include directory for TemplateLib
#   TEMPLATE_LIB_LIBRARY_DIR - library directory for TemplateLib
#   TEMPLATE_LIB_LIBRARIES   - libraries you need to link to



# Initialize _FOUND variable
SET(TEMPLATE_LIB_FOUND "NO")

# Find headers
FIND_PATH(TEMPLATE_LIB_INCLUDE_DIR
	NAMES "TemplateLib/TemplateLib.h"
	PATHS
	"[HKEY_LOCAL_MACHINE\\SOFTWARE\\TemplateLib\\Current;BinPath]"
	"$ENV{TEMPLATE_LIB_LOCATION}"
	"$ENV{TEMPLATE_LIB_LOCATION}/include"
	"$ENV{TEMPLATE_LIB_LOCATION}/include/TemplateLib"
	"$ENV{TEMPLATE_LIB_HOME}/include"
	/usr/include/
	/usr/include/TemplateLib
	/usr/local/include
	/usr/local/include/TemplateLib
	/opt/local/include/TemplateLib
)

# Find compiled library file
FIND_LIBRARY(TemplateLib
	NAMES libTemplateLib TemplateLib
	PATHS 
	"[HKEY_LOCAL_MACHINE\\SOFTWARE\\TemplateLib\\Current;BinPath]"
	"$ENV{TEMPLATE_LIB_LOCATION}/TEMPLATE_LIB/.libs"
	"$ENV{TEMPLATE_LIB_LOCATION}/lib"
	"$ENV{TEMPLATE_LIB_HOME}/lib"
	/usr/lib64
	/usr/local/lib64
	/opt/local/lib64
	/usr/lib
	/usr/local/lib
	/opt/local/lib
	DOC "TemplateLib library"
)

# Check if library and headers are foundn
IF(TEMPLATE_LIB_INCLUDE_DIR)
	IF(TEMPLATE_LIB_LIBRARIES)
		SET(TEMPLATE_LIB_FOUND "YES")
		GET_FILENAME_COMPONENT(TEMPLATE_LIB_LIBRARY_DIR ${TemplateLib} PATH)
	ENDIF(TEMPLATE_LIB_LIBRARIES)
ENDIF(TEMPLATE_LIB_INCLUDE_DIR)

# Make module friendly with FIND_PACKAGE
IF(NOT TEMPLATE_LIB_FOUND)
	IF(NOT TEMPLATE_LIB_FIND_QUIETLY)
		IF(TEMPLATE_LIB_FIND_REQUIRED)
			MESSAGE(FATAL_ERROR "TemplateLib required, please specify it's location with TEMPLATE_LIB_HOME or TEMPLATE_LIB_LOCATION")
		ELSE(TEMPLATE_LIB_FIND_REQUIRED)
			MESSAGE(STATUS "TemplateLib was not found.")
		ENDIF(TEMPLATE_LIB_FIND_REQUIRED)
	ENDIF(NOT TEMPLATE_LIB_FIND_QUIETLY)
ENDIF(NOT TEMPLATE_LIB_FOUND)
