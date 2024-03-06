# Please see http://quasar.docs.cern.ch/quasarBuildSystem.html for
# information how to use this file.
# LICENSE:
# Copyright (c) 2015, CERN
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS 
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
# GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Author: Piotr Nikiel <piotr@nikiel.info>
# @author pnikiel
# @date 03-Sep-2015
# The purpose of this file is to set default parameters in case no build configuration file (aka toolchain) was specified.
# The approach is to satisfy the requirements as much as possible.

# -------------------------------------------------------------------------------------------------------------------------------

# Modified by: Sebastian Vergara
# @author vergaraa
# @date 06-03-2024
# This CMAKE file was modified to comply with the newer versions of the UA toolkit (1.8.3) as well as the new versions of Quazar. Modifications include: Changing the root folder of the SDK from OPT (gave permission problem errors on Almalinux 9) to the root of the Quasar folder. Modified the header directories so that they follow the updated version of the UA sdk, and linked the libraries to the final executable. 
# To run, download the SDK from UA, place it in the root of the folder (So, where the quasar.py file is located) and run 
# ./quasar.py set_build_config CustomETMSConfig.cmake
# And finally run
# ./quasar.py build
# If you get a WrongReturnValue: tool cmake returned 1, try running it with sudo

message ("Assuming standard Boost installation as no BOOST_PATH_HEADERS is defined in your environment")
SET( BOOST_PATH_HEADERS "" )
SET( BOOST_PATH_LIBS "" )
SET( BOOST_LIBS "-lboost_program_options -lboost_thread -lboost_system" )

#------
#OPCUA
#------
SET( OPCUA_TOOLKIT_PATH "${CMAKE_SOURCE_DIR}/SDK" )

    
SET( OPCUA_TOOLKIT_LIBS_DEBUG "-luamoduled -lcoremoduled -luabasecppd -luastackd -luapkicppd -lxmlparsercppd -lxml2 -lssl -lcrypto -lpthread" ) 
SET( OPCUA_TOOLKIT_LIBS_RELEASE "-luamodule -lcoremodule -luabasecpp -luastack -luapkicpp -lxmlparsercpp -lxml2 -lssl -lcrypto -lpthread" ) 

add_custom_target( quasar_opcua_backend_is_ready ) 

include_directories (
	${OPCUA_TOOLKIT_PATH}/include/embeddedstack
	${OPCUA_TOOLKIT_PATH}/include/pubsubbasecpp
	${OPCUA_TOOLKIT_PATH}/include/pubsubmodule
	${OPCUA_TOOLKIT_PATH}/include/uabasecpp
	${OPCUA_TOOLKIT_PATH}/include/uaclientcpp
	${OPCUA_TOOLKIT_PATH}/include/uamodels
	${OPCUA_TOOLKIT_PATH}/include/uapkicpp
	${OPCUA_TOOLKIT_PATH}/include/uapubsub
	${OPCUA_TOOLKIT_PATH}/include/uaservercpp
	${OPCUA_TOOLKIT_PATH}/include/uastack
	${OPCUA_TOOLKIT_PATH}/include/xmlparsercpp
)


#-----
#OPCUA Libs
#-----

SET( XML_LIBS "-lxerces-c" ) 

#-----
#Link the lib directories to the executable.
link_directories(${OPCUA_TOOLKIT_PATH}/lib)


#-----
#General settings
#-----

# TODO: split between Win / MSVC, perhaps MSVC has different notation for these
add_definitions(-Wall -Wno-deprecated -std=gnu++0x -DBACKEND_UATOOLKIT ) 

#-------
# Github replacement
#-------
# If used, replaces https://github.com/ in modules which are fetched on demand,
# this can be used if private mirror git servers are used instead of github.
# Example, edit and uncomment if required.
#
#set(GIT_SERVER_REPLACEMENT "ssh://git@gitlab.cern.ch:7999/" )
