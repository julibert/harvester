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

include(ExternalProject)

ExternalProject_Add(Catch2
    GIT_REPOSITORY
        https://github.com/catchorg/Catch2.git
    GIT_TAG
        v2.x
    INSTALL_DIR
        ${RECIPE_INSTALL_PATH}
    CMAKE_CACHE_ARGS
        -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
        -DCATCH_BUILD_TESTING:BOOL=OFF
        -DCATCH_BUILD_EXAMPLES:BOOL=OFF
        -DCATCH_INSTALL_DOCS:BOOL=OFF
        -DCATCH_INSTALL_HELPERS:BOOL=ON
        -DBUILD_TESTING:BOOL=ON
    )