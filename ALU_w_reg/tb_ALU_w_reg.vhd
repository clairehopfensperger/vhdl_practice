----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 02:39:19 PM
-- Design Name: 
-- Module Name: tb_ALU_w_reg - arch_tb
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

use IEEE.std_logic_arith.ALL;

entity tb_ALU_w_reg is
    generic (
        clock_delay : time := 5 ns;
        sim_delay   : time := 20 ns 
    );
end tb_ALU_w_reg;

architecture arch_tb of tb_ALU_w_reg is
    signal clk, rst                 : std_logic;
    signal num                      : std_logic_vector(3 downto 0);
    signal en_a, en_b, en_c         : std_logic;
    signal sel_a_path, sel_b_path   : std_logic;  -- {0 = in, 1 = C}
    signal alu_control              : std_logic_vector(2 downto 0);
    signal result                   : std_logic_vector(3 downto 0);
    signal val_to_display           : std_logic_vector(1 downto 0);
begin
    
    DUT : entity work.ALU_w_reg(arch_ALU_w_reg)
        port map (
            clk => clk,
            rst => rst,
            num => num,
            en_a => en_a,
            en_b => en_b,
            en_c => en_c, 
            sel_a_path => sel_a_path,
            sel_b_path => sel_b_path,
            alu_control => alu_control,
            val_to_disp => val_to_display,
            result => result
        );
      
    -- generating clk?
    clk <= not clk after clock_delay;
        
    -- tests 
    process
    begin
        
        -- start clk and rst
        rst <= '0';
        clk <= '0';
        wait for sim_delay;
        rst <= '1';
        wait for sim_delay;
        
        -- load A with 3 
        num <= conv_std_logic_vector(3, 4);  -- needed to use std_logic_arith library
        en_a <= '1';
        en_b <= '0';
        en_c <= '0';
        sel_a_path <= '0';
        sel_b_path <= '0';
        alu_control <= conv_std_logic_vector(0, 3);
        val_to_display <= "01";
        wait for sim_delay;
        
        -- load B with 5 
        num <= conv_std_logic_vector(5, 4);
        en_a <= '0';
        en_b <= '1';
        en_c <= '0';
        sel_a_path <= '0';
        sel_b_path <= '0';
        alu_control <= conv_std_logic_vector(0, 3);
        val_to_display <= "11";
        wait for sim_delay;
        
        -- add A + B and place in C 
        num <= conv_std_logic_vector(0, 4);
        en_a <= '0';
        en_b <= '0';
        en_c <= '1';
        sel_a_path <= '0';
        sel_b_path <= '0';
        alu_control <= conv_std_logic_vector(0, 3);
        val_to_display <= "00";
        wait for sim_delay;
        
        -- move C to A
        num <= conv_std_logic_vector(0, 4);
        en_a <= '1';
        en_b <= '0';
        en_c <= '0';
        sel_a_path <= '1';
        sel_b_path <= '0';
        alu_control <= conv_std_logic_vector(0, 3);
        val_to_display <= "01";
        wait for sim_delay;
        
        -- add something  -- i'll be honest, idk what this does
        num <= conv_std_logic_vector(0, 4);
        en_a <= '0';
        en_b <= '0';
        en_c <= '1';
        sel_a_path <= '1';
        sel_b_path <= '0';
        alu_control <= conv_std_logic_vector(0, 3);
        val_to_display <= "00";
        wait for sim_delay;
        
        -- move C to B 
        num <= conv_std_logic_vector(0, 4);
        en_a <= '0';
        en_b <= '1';
        en_c <= '0';
        sel_a_path <= '1';
        sel_b_path <= '1';
        alu_control <= conv_std_logic_vector(0, 3);
        val_to_display <= "11";
        wait for sim_delay;
        
        -- add something  -- i'll be honest, idk what this does
        num <= conv_std_logic_vector(0, 4);
        en_a <= '0';
        en_b <= '0';
        en_c <= '1';
        sel_a_path <= '1';
        sel_b_path <= '0';
        alu_control <= conv_std_logic_vector(0, 3);
        val_to_display <= "00";
        wait for sim_delay;
        
        -- terminating process
        assert false 
        report "Simulation Completed" 
        severity failure; 
        
    end process;
    
    -- generating clock 
    --process
    --begin
    --    clk <= not clk after clock_delay;
    --end process;
     
end arch_tb;
