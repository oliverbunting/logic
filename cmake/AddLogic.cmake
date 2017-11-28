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

include(AddThreads)
include(AddGnuCompiler)
include(AddMsvcCompiler)
include(AddClangCompiler)
include(AddQuartusProject)
include(AddHDL)

find_package(SVUnit)
find_package(ModelSim)
find_package(NaturalDocs)
find_package(SystemC REQUIRED COMPONENTS SCV UVM)
find_package(Verilator REQUIRED)
find_package(Quartus)
find_package(GTest)
