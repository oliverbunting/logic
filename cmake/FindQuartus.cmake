# Copyright 2017 Tymoteusz Blazejczyk
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#.rst:
# FindQuartus
# --------
#
# Find Quartus
#
# ::
#
#   QUARTUS_EXECUTABLE  - Quartus executable
#   QUARTUS_SH          - Quartus sh
#   QUARTUS_MAP         - Quartus map
#   QUARTUS_SYN         - Quartus syn
#   QUARTUS_FOUND       - true if Quartus found

if (QUARTUS_FOUND)
    return()
endif()

find_package(PackageHandleStandardArgs REQUIRED)

set(QUARTUS_HINTS
    $ENV{QUARTUS_ROOTDIR}
    $ENV{QUARTUS_HOME}
    $ENV{QUARTUS_ROOT}
    $ENV{QUARTUS_DIR}
    $ENV{QUARTUS}
)

find_program(QUARTUS_EXECUTABLE quartus
    HINTS ${QUARTUS_HINTS}
    PATH_SUFFIXES bin bin64
    DOC "Path to the Quartus executable"
)

find_program(QUARTUS_MAP quartus_map
    HINTS ${QUARTUS_HINTS}
    PATH_SUFFIXES bin bin64
    DOC "Path to the Quartus map executable"
)

find_program(QUARTUS_SYN quartus_syn
    HINTS ${QUARTUS_HINTS}
    PATH_SUFFIXES bin bin64
    DOC "Path to the Quartus syn executable"
)

find_program(QUARTUS_SH quartus_sh
    HINTS ${QUARTUS_HINTS}
    PATH_SUFFIXES bin bin64
    DOC "Path to the Quartus sh executable"
)

if (QUARTUS_SH)
    execute_process(COMMAND ${QUARTUS_SH}
        --tcl_eval puts "$quartus(version)"
        OUTPUT_VARIABLE quartus_version
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    if (quartus_version MATCHES Pro)
        set(QUARTUS_EDITION Pro)
    else ()
        set(QUARTUS_EDITION Standard)
    endif()
endif()

get_filename_component(QUARTUS_DIR ${QUARTUS_EXECUTABLE} DIRECTORY)

find_file(QUARTUS_MEGA_FUNCTIONS altera_mf.v
    HINTS ${QUARTUS_DIR}/..
    PATH_SUFFIXES eda eda/sim_lib
    DOC "Path to the Quartus Mega Functions"
)

mark_as_advanced(QUARTUS_EXECUTABLE)
mark_as_advanced(QUARTUS_SH)
mark_as_advanced(QUARTUS_MAP)
mark_as_advanced(QUARTUS_SYN)
mark_as_advanced(QUARTUS_MEGA_FUNCTIONS)

find_package_handle_standard_args(Quartus REQUIRED_VARS
    QUARTUS_EXECUTABLE QUARTUS_MAP QUARTUS_SYN
    QUARTUS_SH QUARTUS_MEGA_FUNCTIONS)
