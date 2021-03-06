# Copyright 2020-present Julián Bermúdez Ortega.
#
# This file is part of julibert::harvester.
#
# julibert::harvester is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# julibert::harvester is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with julibert::harvester.  If not, see <https://www.gnu.org/licenses/>.

set(HARVESTER_PATH ${CMAKE_CURRENT_LIST_DIR} CACHE INTERNAL "")

macro(harvest_package)
    if(NOT DEFINED ENV{HARVESTER_HOME})
        message(FATAL_ERROR "HARVESTER_HOME environment variable is not set")
        if(NOT EXISTS $ENV{HARVESTER_HOME})
            message(FATAL_ERROR "$ENV{HARVESTER_HOME} does not exist")
        endif()
    endif()

    find_package(${ARGN} QUIET PATHS $ENV{HARVESTER_HOME})
    set(_package_name ${ARGV0})
    if(NOT ${_package_name}_FOUND)
        execute_process(
            COMMAND
                ${CMAKE_COMMAND}
                    -H${HARVESTER_PATH}/recipes
                    -B${PROJECT_BINARY_DIR}/${_package_name}
                    -DRECIPE_SOURCE=${HARVESTER_PATH}/recipes/${_package_name}.cmake
            )

        execute_process(
            COMMAND
                ${CMAKE_COMMAND}
                    --build ${PROJECT_BINARY_DIR}/${_package_name}
            )
    endif()
    find_package(${ARGN} REQUIRED PATHS $ENV{HARVESTER_HOME})
endmacro()