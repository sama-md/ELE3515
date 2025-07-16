--
-- Copyright (C) 2025 Samaherni M. D.
-- Laboratory of Automation, Control and Instrumentation (LACI)
-- Federal University of Rio Grande do Norte (UFRN)
-- 
-- This file is part of ELE3515 project (https://github.com/sama-md/ELE3515/). 
-- It is subject to the license terms in the LICENSE file found in the top-level 
-- directory of this distribution. 
--
-- Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 
-- 4.0 International License;
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--  (EN)  https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode
--  (PT)  https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.pt
--
-- Unless otherwise separately undertaken by the Licensor, to the extent possible, 
-- the Licensor offers the Licensed Material "as-is" and "as-available", and makes
-- no representations or warranties of any kind concerning the Licensed Material, 
-- whether express, implied, statutory, or other.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom4_12b is
   port (clk : in  std_logic;
         en  : in  std_logic;
         addr: in  std_logic_vector( 1 downto 0);
         data: out std_logic_vector(11 downto 0));
end rom4_12b;

architecture logica of rom4_12b is

type rom is array (0 to 3) of std_logic_vector(11 downto 0);
signal memoria : rom := (x"401",x"411",x"412",x"413");
signal r_addr  : std_logic_vector(0 to 1);

begin
   process(clk)
   begin
      if rising_edge(clk) then
         if en='1' then
            r_addr <= addr;
         end if;
      end if;
   end process;
   data <= memoria(to_integer(unsigned(r_addr)));
end logica;