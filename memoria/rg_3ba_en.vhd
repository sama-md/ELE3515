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

entity reg_3b_assync_en is
  port (ck, clr, set, ld : in  std_logic; 
                       d : in  std_logic_vector(2 downto 0);    
                       q : out std_logic_vector(2 downto 0));    
end reg_3b_assync_en;

architecture logica of reg_3b_assync_en is

begin
  process (ck, clr, set)
  begin
    if    (clr = '1') then q <= "000";   -- q=000 independente de ck
    elsif (set = '1') then q <= "111";   -- q=111 independente de ck 
    elsif (ck'event and ck = '1') then   -- detecta borda de ck
      if  (ld = '1') then q <= d;        -- verifica habilitacao
      end if;
    end if;
  end process;
end logica;