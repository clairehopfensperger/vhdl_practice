----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 12:25:23 PM
-- Design Name: 
-- Module Name: ALU - arch_ALU
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    port (
        clk     : in std_logic;
        num_a   : in std_logic_vector(5 downto 0);
        num_b   : in std_logic_vector(5 downto 0);
        control : in std_logic_vector(2 downto 0);
        result  : out std_logic_vector(5 downto 0)
    );
end ALU;

architecture arch_ALU of ALU is
    constant add     : std_logic_vector(2 downto 0) := "000";
    constant sub     : std_logic_vector(2 downto 0) := "001";
    constant gt      : std_logic_vector(2 downto 0) := "010";
    constant eq      : std_logic_vector(2 downto 0) := "011";
    constant b_xor   : std_logic_vector(2 downto 0) := "100";
    constant b_and   : std_logic_vector(2 downto 0) := "101";
    constant b_or    : std_logic_vector(2 downto 0) := "110";
    constant neg     : std_logic_vector(2 downto 0) := "111";
begin
    
    -- case statement 
    process (clk, control) is
    begin 
        if (rising_edge(clk)) then
            case control is
                when add =>
                    result <= std_logic_vector(unsigned(num_a) + unsigned(num_b));
                when sub =>
                    result <= std_logic_vector(unsigned(num_a) - unsigned(num_b));
                when gt =>
                    if num_a(3) = '1' and num_b(3) = '0' then
                        result <= "000000";
                    elsif num_a(3) = '0' and num_b(3) = '1' then
                        result <= "000001";
                    else 
                        --result <= std_logic_vector(unsigned(num_a) > unsigned(num_b));  -- error
                        if num_a > num_b then 
                            result <= "000001";
                        else
                            result <= "000000";
                        end if;
                    end if;
                when eq =>
                    --result <= std_logic_vector(unsigned(num_a) = unsigned(num_b));  -- error
                    if num_a = num_b then 
                        result <= "000001";
                    else
                        result <= "000000";
                    end if;
                when b_xor =>
                    result <= num_a xor num_b;
                when b_and =>
                    result <= num_a and num_b;
                when b_or =>
                    result <= num_a or num_b;
                when neg =>    
                    result <= not num_a;
                when others => 
                    result <= "000000";
            end case;
        end if;
    end process;    
         
end arch_ALU;
