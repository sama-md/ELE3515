# 
# Copyright (C) 2025 Samaherni M. D.
# Laboratory of Automation, Control and Instrumentation (LACI)
# Federal University of Rio Grande do Norte (UFRN)
# 
# This file is part of ELE3515 project (https://github.com/sama-md/ELE3515/). 
# It is subject to the license terms in the LICENSE file found in the top-level 
# directory of this distribution. 
# 
# Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 
# 4.0 International License;
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#  (EN)  https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode
#  (PT)  https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.pt
# 
# Unless otherwise separately undertaken by the Licensor, to the extent possible, 
# the Licensor offers the Licensed Material "as-is" and "as-available", and makes
# no representations or warranties of any kind concerning the Licensed Material, 
# whether express, implied, statutory, or other.
# See the License for the specific language governing permissions and
# limitations under the License.
# 

vsim -t ns ckt 

add wave * 

force a(0) 0 0ns, 1 10ns -repeat 20ns
force a(1) 0 0ns, 1 20ns -repeat 40ns
force a(2) 0 0ns, 1 30ns -repeat 60ns
force b(0) 0 0ns, 1 40ns -repeat 80ns
force b(1) 0 0ns, 1 50ns -repeat 100ns
force b(2) 0 0ns, 1 60ns -repeat 120ns

run 120ns