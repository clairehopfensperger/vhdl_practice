----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 11:27:07 AM
-- Design Name: 
-- Module Name: add_bit - Behavioral
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

entity add_bit is
--  Port ( );
    port(
        a_bit        : in std_logic;
        b_bit        : in std_logic;
        carry_in     : in std_logic;
        carry_out    : out std_logic;
        temp_sum     : out std_logic
    );
end add_bit;

architecture arch_add_bit of add_bit is
begin
    temp_sum <= (a_bit xor b_bit) xor carry_in;
    carry_out <= (a_bit and b_bit) or (b_bit and carry_in) or (a_bit and carry_in);
end arch_add_bit;
