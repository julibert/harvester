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

set(_name fmt)

ExternalProject_Add(${_name}
    GIT_REPOSITORY
          https://github.com/fmtlib/fmt.git
    GIT_TAG
        master
    INSTALL_DIR
        $ENV{HARVESTER_HOME}/${_name}
    CMAKE_CACHE_ARGS
        -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
        -DFMT_DOC:BOOL=OFF
        -DFMT_TEST:BOOL=OFF
        -DFMT_FUZZ:BOOL=OFF
    )