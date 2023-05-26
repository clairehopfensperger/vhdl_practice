----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 02:12:16 PM
-- Design Name: 
-- Module Name: factorial - arch_factorial
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

entity factorial is
    port (
        clk, rst    : in std_logic;
        num         : in integer;
        result      : out integer := 0;
        complete    : out std_logic := '0'
    );
end factorial;

architecture arch_factorial of factorial is
    signal temp  : integer := 1;
    signal counter  : integer := num;
    
    -- defining states
    type state_type is (INIT, CHECK, EXEC, INC, DONE, ERROR);
    signal state    : state_type;
begin
    
    -- FSM woot woot
    process (clk, rst)
    begin
        if (rst = '0') then 
            state <= init;
        elsif (rising_edge(clk)) then
            case (state) is
                when INIT =>
                    state <= CHECK;
                    counter <= 5;
                when CHECK => 
                    if (counter > 0) then
                        state <= EXEC;
                    else    
                        state <= DONE;
                    end if;
                when EXEC => 
                    state <= INC;
                    temp <= temp * counter;
                when INC => 
                    state <= CHECK;
                    counter <= counter - 1;
                when DONE => 
                    state <= DONE;
                    result <= temp;
                    complete <= '1';
                    -- idk if this'll work but let's find out  -- maybe check in tb when state = DONE
                    -- terminating process
                    --assert false 
                    --report "FSM Completed" 
                    --severity failure; 
                when others => 
                    state <= ERROR;
            end case;
        end if;
        
    end process;
                
end arch_factorial;
