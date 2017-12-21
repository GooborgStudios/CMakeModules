##########
#
### Nightwave Studios' Find Module Template
# 
# When creating a new find module to add to this repository, use the following format.
# Replace "TemplateLib" with the name of the library.
# Update paths and files to look for as appropriate.
# If the library has multiple parts (i.e. how GraphicsMagick has Magick, Magick++, and MagickWand), copy the calls and modify message as appropriate.
#
# Make sure to remove these top twelve lines before submitting a PR!
#
##########

# -*-cmake-*-
#
# Nightwave Studios - FindTemplateLib.cmake
# https://www.nightwave.co
#
# Search for TemplateLib library files
#
# Once loaded this will define:
#   TemplateLib_FOUND       - system has TemplateLib
#   TemplateLib_INCLUDE_DIR - include directory for TemplateLib
#   TemplateLib_LIBRARY_DIR - library directory for TemplateLib
#   TemplateLib_LIBRARIES   - libraries you need to link to



# Find headers
find_path(TemplateLib_INCLUDE_DIR
	NAMES "TemplateLib/TemplateLib.h"
	PATHS
	"[HKEY_LOCAL_MACHINE\\SOFTWARE\\TemplateLib\\Current;BinPath]"
	"$ENV{TemplateLib_LOCATION}"
	"$ENV{TemplateLib_LOCATION}/include"
	"$ENV{TemplateLib_LOCATION}/include/TemplateLib"
	"$ENV{TemplateLib_HOME}/include"
	/usr/include/
	/usr/include/TemplateLib
	/usr/local/include
	/usr/local/include/TemplateLib
	/opt/local/include/TemplateLib
)

# Find compiled library file
find_library(TemplateLib_LIBRARIES
	NAMES libTemplateLib TemplateLib
	PATHS 
	"[HKEY_LOCAL_MACHINE\\SOFTWARE\\TemplateLib\\Current;BinPath]"
	"$ENV{TemplateLib_LOCATION}/TemplateLib/.libs"
	"$ENV{TemplateLib_LOCATION}/lib"
	"$ENV{TemplateLib_HOME}/lib"
	/usr/lib64
	/usr/local/lib64
	/opt/local/lib64
	/usr/lib
	/usr/local/lib
	/opt/local/lib
	DOC "TemplateLib library"
)

# Get path to library
get_filename_component(TemplateLib_LIBRARY_DIR ${TemplateLib_LIBRARIES} PATH)

# Set TemplateLib_FOUND and print message
INCLUDE(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
	TemplateLib
	DEFAULT_MSG

	TemplateLib_LIBRARIES
	TemplateLib_INCLUDE_DIR
)
