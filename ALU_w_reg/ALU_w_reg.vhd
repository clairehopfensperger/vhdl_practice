----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 02:39:19 PM
-- Design Name: 
-- Module Name: ALU_w_reg - arch_ALU_w_reg
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

entity ALU_w_reg is
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        num     : in std_logic_vector(3 downto 0);
        en_a    : in std_logic;
        en_b    : in std_logic;
        en_c    : in std_logic;
        sel_a_path  : in std_logic;  -- {0 = num, 1 = C}
        sel_b_path  : in std_logic;  -- {0 = num, 1 = C}
        alu_control : in std_logic_vector(2 downto 0);
        val_to_disp : in std_logic_vector(1 downto 0);  -- {0 = C, 1 = A, 2 = B}
        result  : out std_logic_vector(3 downto 0)
    );
end ALU_w_reg;

architecture arch_ALU_w_reg of ALU_w_reg is
    signal result_a     : std_logic_vector(3 downto 0);
    signal result_b     : std_logic_vector(3 downto 0);
    signal result_c     : std_logic_vector(3 downto 0);
    signal result_ALU   : std_logic_vector(3 downto 0);
    signal in_a         : std_logic_vector(3 downto 0);
    signal in_b         : std_logic_vector(3 downto 0);
begin

    -- instantiations of registers
    reg_a : entity work.reg(arch_reg)
        port map (
            clk => clk,
            rst => rst,
            num => num,
            en => en_a,
            result => result_a
        );
        
    reg_b : entity work.reg(arch_reg)
        port map (
            clk => clk,
            rst => rst,
            num => num,
            en => en_b,
            result => result_b
        );
        
    reg_c : entity work.reg(arch_reg)
        port map (
            clk => clk,
            rst => rst,
            num => result_ALU,
            en => en_c,
            result => result_c
        );
    
    -- execution of stuff :)
    
    -- mux for putting stuff in reg A 
    process (sel_a_path, in_a, result_c, num) is
    begin
        if sel_a_path = '0' then
            in_a <= num;
        elsif sel_a_path = '1' then
            in_a <= result_c;
        end if;
    end process;
    
    -- mux for putting stuff in reg B
    process (sel_b_path, in_b, result_c, num) is
    begin
        if sel_b_path = '0' then
            in_b <= num;
        elsif sel_b_path = '1' then
            in_b <= result_c;
        end if;
    end process;
    
    -- mux for display path 
    process (val_to_disp) is
    begin
        if val_to_disp = "00" then
            result <= result_c;
        elsif val_to_disp = "01" then
            result <= result_a;
        elsif val_to_disp = "11" then
            result <= result_b;
        end if;
    end process;

end arch_ALU_w_reg;
