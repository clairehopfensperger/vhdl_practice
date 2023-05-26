----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 02:12:16 PM
-- Design Name: 
-- Module Name: tb_factorial - arch_tb
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

entity tb_factorial is
end tb_factorial;

architecture arch_tb of tb_factorial is
    constant T : time := 10 ns;  -- clk period
    
    signal clk, rst    : std_logic;
    signal num         : integer;
    signal result      : integer;
    signal complete    : std_logic;
begin
    
    DUT : entity work.factorial(arch_factorial)
        port map (
            clk => clk,
            rst => rst,
            num => num,
            result => result,
            complete => complete
        );
    
    -- clock 
    -- 10 ns clk running forever 
    process
    begin
        clk <= '0';
        wait for T/2;
        clk <= '1';
        wait for T/2;
    end process;
        
    -- reset changed to start sim 
    rst <= '0', '1' after T/2;
    
    process
    begin
    
        num <= 5;
        
        wait;
        
    end process;

end arch_tb;
