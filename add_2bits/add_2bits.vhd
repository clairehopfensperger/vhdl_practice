----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 09:52:22 AM
-- Design Name: 
-- Module Name: 2bit_adder - Behavioral
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

entity add_2bits is
--  Port ( );
    Port(
        a   : in std_logic_vector(1 downto 0);
        b   : in std_logic_vector(1 downto 0);
        s   : out std_logic_vector(1 downto 0)
    );
end add_2bits;

architecture adder of add_2bits is
    signal c0, c1   : std_logic;
begin
    
    -- instantiating add_bit for each bit of inputs
    add_bit0: entity work.add_bit(arch_add_bit)
        port map(
            a_bit => a(0),
            b_bit => b(0),
            carry_in => '0',
            carry_out => c0,
            temp_sum => s(0)
        );
    add_bit1: entity work.add_bit(arch_add_bit)
        port map(
            a_bit => a(1),
            b_bit => b(1),
            carry_in => c0,
            carry_out => c1,
            temp_sum => s(1)
        );
end adder;
