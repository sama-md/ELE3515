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
use ieee.std_logic_unsigned.all;

entity ram256_16b is
  port (
    clk   : in  std_logic;
    we    : in  std_logic;
    raddr : in  std_logic_vector( 7 downto 0);
    waddr : in  std_logic_vector( 7 downto 0);    
    datai : in  std_logic_vector(15 downto 0);
    datao : out std_logic_vector(15 downto 0)
  );
end ram256_16b;

architecture ckt of ram256_16b is

   type memoria_ram is array (0 to 255) of std_logic_vector (15 downto 0);
   signal RAM : memoria_ram := (0      => X"0017",
                                1      => X"3008",
                                2      => X"0103",
                                others => X"0000");
begin

    process (clk) begin
        if rising_edge(clk) then
            if we = '1' then
                RAM(conv_integer(waddr))<=datai;
            end if;
            datao <= RAM(conv_integer(raddr));
        end if;
    end process;

end ckt;