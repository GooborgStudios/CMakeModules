# -*-cmake-*-
#
# Gooborg Studios - FindTinySpline.cmake
# http://www.gooborg.com
#
# Search for TinySpline library files
#
# Once loaded this will define:
#   TinySpline_FOUND       - system has TinySpline
#   TinySpline_INCLUDE_DIR - include directory for TinySpline
#   TinySpline_LIBRARY_DIR - library directory for TinySpline
#   TinySpline_LIBRARIES   - libraries you need to link to

#   TinySpline++_INCLUDE_DIR - include directory for TinySpline for C++
#   TinySpline++_LIBRARY_DIR - library directory for TinySpline for C++
#   TinySpline++_LIBRARIES   - libraries you need to link to



# Find headers
find_path(TinySpline_INCLUDE_DIR
	NAMES "tinyspline.h"
	PATHS
	"[HKEY_LOCAL_MACHINE\\SOFTWARE\\TinySpline\\Current;BinPath]"
	"$ENV{TinySpline_LOCATION}"
	"$ENV{TinySpline_LOCATION}/include"
	"$ENV{TinySpline_LOCATION}/include/TinySpline"
	"$ENV{TinySpline_HOME}/include"
	/usr/include/
	/usr/include/TinySpline
	/usr/local/include
	/usr/local/include/TinySpline
	/opt/local/include/TinySpline
)

find_path(TinySpline++_INCLUDE_DIR
	NAMES "tinysplinecpp.h"
	PATHS
	"[HKEY_LOCAL_MACHINE\\SOFTWARE\\TinySpline\\Current;BinPath]"
	"$ENV{TinySpline_LOCATION}"
	"$ENV{TinySpline_LOCATION}/include"
	"$ENV{TinySpline_LOCATION}/include/TinySpline"
	"$ENV{TinySpline_HOME}/include"
	/usr/include/
	/usr/include/TinySpline
	/usr/local/include
	/usr/local/include/TinySpline
	/opt/local/include/TinySpline
)

# Find compiled library file
find_library(TinySpline_LIBRARIES
	NAMES libtinyspline tinyspline
	PATHS 
	"[HKEY_LOCAL_MACHINE\\SOFTWARE\\TinySpline\\Current;BinPath]"
	"$ENV{TinySpline_LOCATION}/TinySpline/.libs"
	"$ENV{TinySpline_LOCATION}/lib"
	"$ENV{TinySpline_HOME}/lib"
	/usr/lib64
	/usr/local/lib64
	/opt/local/lib64
	/usr/lib
	/usr/local/lib
	/opt/local/lib
	DOC "TinySpline library"
)

find_library(TinySpline++_LIBRARIES
	NAMES libtinysplinecpp tinysplinecpp
	PATHS 
	"[HKEY_LOCAL_MACHINE\\SOFTWARE\\TinySpline\\Current;BinPath]"
	"$ENV{TinySpline_LOCATION}/TinySpline/.libs"
	"$ENV{TinySpline_LOCATION}/lib"
	"$ENV{TinySpline_HOME}/lib"
	/usr/lib64
	/usr/local/lib64
	/opt/local/lib64
	/usr/lib
	/usr/local/lib
	/opt/local/lib
	DOC "TinySpline C++ library"
)

# Get path to library
get_filename_component(TinySpline_LIBRARY_DIR ${TinySpline_LIBRARIES} PATH)
get_filename_component(TinySpline++_LIBRARY_DIR ${TinySpline++_LIBRARIES} PATH)

# Set variables as advanced (hide from GUI unless "show advanced checked")
mark_as_advanced(TinySpline_LIBRARIES TinySpline_LIBRARY_DIR TinySpline_INCLUDE_DIR)
mark_as_advanced(TinySpline++_LIBRARIES TinySpline++_LIBRARY_DIR TinySpline++_INCLUDE_DIR)

# Set TinySpline_FOUND and print message
INCLUDE(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
	TinySpline
	DEFAULT_MSG
	
	TinySpline_LIBRARIES
	TinySpline_INCLUDE_DIR
	TinySpline++_LIBRARIES
	TinySpline++_INCLUDE_DIR
)
