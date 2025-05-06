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

entity mde_seq is
   port (ck, rst : in  std_logic;
         q       : out std_logic_vector(1 downto 0));
end mde_seq;

architecture logica of mde_seq is
signal qx : std_logic_vector(1 downto 0);

begin
  process (ck, rst)
  begin
    if rst = '1' then                     -- estado inicial
      qx <= "00";
    elsif (ck'event and ck ='1') then     -- ciclo de estados
      case qx is
        when "00" => qx <= "01";
        when "01" => qx <= "11";
        when "11" => qx <= "10";
        when "10" => qx <= "00";
        when others => 
       end case;
    end if;
  end process;
  q <= qx;
end logica; 