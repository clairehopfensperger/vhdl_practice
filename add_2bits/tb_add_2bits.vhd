----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 09:52:22 AM
-- Design Name: 
-- Module Name: tb_2bit_adder - Behavioral
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

entity tb_2bit_adder is
end tb_2bit_adder;

architecture arch_tb_2b of tb_2bit_adder is
    signal in_a, in_b   : std_logic_vector(1 downto 0);
    signal sum          : std_logic_vector(1 downto 0);
begin
    DUT : entity work.add_2bits(adder)
        port map(  -- NOTE: use commas here instead of semicolons 
            a => in_a,
            b => in_b,
            s => sum 
        );
        
    -- tests 
    process  -- for some reason this repeats a ton, let's figure this out - FIXED (see below)
    begin
        -- test 1 
        in_a <= "00";
        in_b <= "01";
        wait for 20 ns;
        -- output: 01
        
        -- test 2 
        in_a <= "01";
        in_b <= "10";
        wait for 20 ns;
        -- output: 11
        
        -- test 3 
        in_a <= "11";
        in_b <= "01";
        wait for 20 ns;
        -- output: 00
        
        -- terminate sim - done so by generating an artificial failure which stops the simulation after the last wait statement
            -- cannot use with "wait"
        assert false 
        report "Simulation Completed" 
        severity failure; 
        
    end process;    

end arch_tb_2b;
