----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 02:39:19 PM
-- Design Name: 
-- Module Name: register - arch_reg
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        num     : in std_logic_vector(5 downto 0);
        en      : in std_logic;
        result  : out std_logic_vector(5 downto 0)
    );
end reg;

architecture arch_reg of reg is

begin
    
    process (clk, rst) is
    begin
    
        if (rst = '0') then
            result <= (others => '0');
        elsif (clk'event and clk = '1') then  -- clk'event means that something changed with clk, then I'm checking if it went high
            if (en = '1') then
                result <= num;
            end if;
        end if;
    
    end process;

end arch_reg;
