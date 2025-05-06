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
entity mde_moore1p is
   port (ck, rst, s : in  std_logic;
                  q : out std_logic_vector(1 downto 0));
end mde_moore1p;
architecture logica of mde_moore1p is
  type st is (A, B, C, D);  
  signal estado : st;                          
begin
  process (ck, rst)
  begin
    if rst = '1' then                 
      estado <= A;                   
    elsif (ck'event and ck ='1') then    
      case estado is
        when A =>                         
          if s = '1' then estado <= B; 
          else            estado <= D; 
          end if;
        when B =>                         
          if s = '1' then estado <= C; 
          else            estado <= A;
          end if;
        when C =>                         
          if s = '1' then estado <= D;
          else            estado <= B; 
          end if;
        when D =>                         
          if s = '1' then estado <= A;
          else            estado <= C;
          end if;
       end case;
    end if;
  end process;
  with estado select  
    q <= "00" when A,
         "01" when B, 
         "11" when C, 
         "10" when D; 
end logica; 