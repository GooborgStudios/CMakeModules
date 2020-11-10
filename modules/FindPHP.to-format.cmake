# - Find PHP
# This module finds if PHP is installed and determines where the include files
# and libraries are. 
#
# Note, unlike the FindPHP4 module, this module uses the php-config script to
# determine information about the installed PHP configuration.  For Linux
# distributions, this script is normally installed as part of some php-dev or
# php-devel package. See http://php.net/manual/en/install.pecl.php-config.php
# for php-config documentation.
#
# This code sets the following variables:
#  PHP_EXECUTABLE             = full path to the php binary
#  PHP_CONFIG_EXECUTABLE      = full path to the php-config binary
#  PHP_EXTENSIONS_DIR         = directory containing PHP extensions
#  PHP_EXTENSIONS_INCLUDE_DIR = directory containing PHP extension headers
#  PHP_INCLUDE_DIRS           = include directives for PHP development
#  PHP_VERSION_NUMBER         = PHP version number in PHP's "vernum" format eg 50303
#  PHP_VERSION_STRING         = PHP version string eg 5.3.3-1ubuntu9.3
#  PHP_FOUND                  = set to TRUE if all of the above has been found.
#

#=============================================================================
# Copyright 2011-2012 Paul Colby
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file LICENSE.md for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)
#
# This file has been modified to include the option to specify a "devel" component
# and find Zend headers.  © Nightwave Studios, 2017.
#

set(PHP_FOUND FALSE)
set(PHP_DEVEL_COMPONENT_FOUND FALSE)

if(PHP_FIND_COMPONENTS)
	foreach(component ${PHP_FIND_COMPONENTS})
		string(TOUPPER ${component} _COMPONENT)
		set(PHP_USE_${_COMPONENT} 1)
	endforeach()
endif()

FIND_PROGRAM(PHP_CONFIG_EXECUTABLE NAMES php-config5 php-config4 php-config)

if(PHP_CONFIG_EXECUTABLE)
	execute_process(
		COMMAND
			${PHP_CONFIG_EXECUTABLE} --php-binary
			OUTPUT_VARIABLE PHP_EXECUTABLE
			OUTPUT_STRIP_TRAILING_WHITESPACE
	)

	execute_process(
		COMMAND
			${PHP_CONFIG_EXECUTABLE} --extension-dir
			OUTPUT_VARIABLE PHP_EXTENSIONS_DIR
			OUTPUT_STRIP_TRAILING_WHITESPACE
	)

	execute_process(
		COMMAND
			${PHP_CONFIG_EXECUTABLE} --include-dir
			OUTPUT_VARIABLE PHP_EXTENSIONS_INCLUDE_DIR
			OUTPUT_STRIP_TRAILING_WHITESPACE
	)

	execute_process(
		COMMAND
			${PHP_CONFIG_EXECUTABLE} --includes
			OUTPUT_VARIABLE PHP_INCLUDE_DIRS
			OUTPUT_STRIP_TRAILING_WHITESPACE
	)

	execute_process(
		COMMAND
			${PHP_CONFIG_EXECUTABLE} --vernum
			OUTPUT_VARIABLE PHP_VERSION_NUMBER
			OUTPUT_STRIP_TRAILING_WHITESPACE
	)

	execute_process(
		COMMAND
			${PHP_CONFIG_EXECUTABLE} --version
			OUTPUT_VARIABLE PHP_VERSION_STRING
			OUTPUT_STRIP_TRAILING_WHITESPACE
	)
endif()

MARK_AS_ADVANCED(
	PHP_CONFIG_EXECUTABLE
	PHP_EXECUTABLE
	PHP_EXTENSIONS_DIR
	PHP_EXTENSIONS_INCLUDE_DIR
	PHP_INCLUDE_DIRS
	PHP_VERSION_STRING
)

set(devel_component_accpeted TRUE)
if(PHP_USE_DEVEL_COMPONENT)
	FIND_PATH(zend_path
		NAMES "zend.h"
		PATHS ${PHP_INCLUDE_DIRS}
	)
	if(zend_path)
		set(PHP_DEVEL_COMPONENT_FOUND TRUE)
	else()
		set(devel_component_accpeted FALSE)
	endif()
endif()

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
	php
	DEFAULT_MSG

	PHP_EXECUTABLE
	PHP_CONFIG_EXECUTABLE
	PHP_EXTENSIONS_DIR
	PHP_EXTENSIONS_INCLUDE_DIR
	PHP_INCLUDE_DIRS
	PHP_VERSION_NUMBER
	PHP_VERSION_STRING
	devel_component_accpeted
)
