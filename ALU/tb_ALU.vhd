----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 12:25:23 PM
-- Design Name: 
-- Module Name: tb_ALU - arch_tb_ALU
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

entity tb_ALU is
    generic (
        add     : std_logic_vector(2 downto 0) := "000";
        sub     : std_logic_vector(2 downto 0) := "001";
        gt      : std_logic_vector(2 downto 0) := "010";
        eq      : std_logic_vector(2 downto 0) := "011";
        b_xor   : std_logic_vector(2 downto 0) := "100";
        b_and   : std_logic_vector(2 downto 0) := "101";
        b_or    : std_logic_vector(2 downto 0) := "110";
        neg     : std_logic_vector(2 downto 0) := "111"
    );
end tb_ALU;

architecture arch_tb_ALU of tb_ALU is
    signal in_a : std_logic_vector(3 downto 0);
    signal in_b : std_logic_vector(3 downto 0);
    signal control : std_logic_vector(2 downto 0);
    signal result : std_logic_vector(3 downto 0);
begin
    -- instantiation
    DUT : entity work.ALU(arch_ALU)
        port map (
            num_a => in_a,
            num_b => in_b,
            control => control,
            result => result
        );
    
    -- tests
    process
    begin
    
        in_a <= "0010";
        in_b <= "0111";
        
        control <= add;  -- 1001
        wait for 20 ns;
        
        control <= sub;  -- 1011
        wait for 20 ns;
        
        control <= gt;  -- 0000
        wait for 20 ns;
        
        control <= eq;  -- 0000
        wait for 20 ns;
        
        control <= b_xor;  -- 0101
        wait for 20 ns;
        
        control <= b_and;  -- 0010
        wait for 20 ns;
        
        control <= b_or;  -- 0111
        wait for 20 ns;
        
        control <= neg;  -- 1101
        wait for 20 ns;
    
    -- terminate simulation
    assert false 
    report "Simulation Completed" 
    severity failure;
    
end process;

end arch_tb_ALU;
