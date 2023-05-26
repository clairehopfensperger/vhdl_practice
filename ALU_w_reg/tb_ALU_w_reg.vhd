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
end tb_ALU_w_reg;

architecture arch_tb of tb_ALU_w_reg is
    constant T          : time := 10 ns;  -- clk period
    --constant SIM_DELAY  : time := 20 ns;
    
    signal clk, rst                 : std_logic;
    signal num                      : std_logic_vector(5 downto 0);
    signal en_a, en_b, en_c         : std_logic;
    signal sel_a_path, sel_b_path   : std_logic;  -- {0 = in, 1 = C}
    signal alu_control              : std_logic_vector(2 downto 0);
    signal result                   : std_logic_vector(5 downto 0);
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
    
    -- tests 
    process
    begin
        
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        
        -- load A with 3 
        num <= conv_std_logic_vector(3, 6);  -- needed to use std_logic_arith library
        en_a <= '1';
        sel_a_path <= '0';
        en_b <= '0';
        sel_b_path <= '0';
        en_c <= '0';
        val_to_display <= "01";
        alu_control <= conv_std_logic_vector(0, 3);
        --wait for SIM_DELAY;
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        
        -- instead of using "wait for SIM_DELAY" I could use "wait until falling_edge(clk)" x2 to pause 2 clk cycles
        
        -- load B with 5 
        num <= conv_std_logic_vector(5, 6);  -- needed to use std_logic_arith library
        en_a <= '0';
        sel_a_path <= '0';
        en_b <= '1';
        sel_b_path <= '0';
        en_c <= '0';
        val_to_display <= "10";
        alu_control <= conv_std_logic_vector(0, 3);
        --wait for SIM_DELAY;
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        
        -- add A + B and place in C 
        num <= conv_std_logic_vector(0, 6);  -- needed to use std_logic_arith library
        en_a <= '0';
        sel_a_path <= '0';
        en_b <= '0';
        sel_b_path <= '0';
        en_c <= '1';
        val_to_display <= "00";
        alu_control <= conv_std_logic_vector(0, 3);
        --wait for SIM_DELAY;
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        
        -- move C to A
        num <= conv_std_logic_vector(0, 6);  -- needed to use std_logic_arith library
        en_a <= '1';
        sel_a_path <= '1';
        en_b <= '0';
        sel_b_path <= '0';
        en_c <= '0';
        val_to_display <= "01";
        alu_control <= conv_std_logic_vector(0, 3);
        --wait for SIM_DELAY;
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        
        -- add a and b and puts it in c
        num <= conv_std_logic_vector(0, 6);  -- needed to use std_logic_arith library
        en_a <= '0';
        sel_a_path <= '1';
        en_b <= '0';
        sel_b_path <= '0';
        en_c <= '1';
        val_to_display <= "00";
        alu_control <= conv_std_logic_vector(0, 3);
        --wait for SIM_DELAY;
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        
        -- move C to B 
        num <= conv_std_logic_vector(0, 6);  -- needed to use std_logic_arith library
        en_a <= '0';
        sel_a_path <= '1';
        en_b <= '1';
        sel_b_path <= '1';
        en_c <= '0';
        val_to_display <= "10";
        alu_control <= conv_std_logic_vector(0, 3);
        --wait for SIM_DELAY;
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        
        -- adds a and b and puts it in c
        num <= conv_std_logic_vector(0, 6);  -- needed to use std_logic_arith library
        en_a <= '0';
        sel_a_path <= '1';
        en_b <= '0';
        sel_b_path <= '0';
        en_c <= '1';
        val_to_display <= "00";
        alu_control <= conv_std_logic_vector(0, 3);
        --wait for SIM_DELAY;
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        
        -- terminating simulation
        assert false 
        report "Simulation Completed" 
        severity failure; 
        
    end process;
     
end arch_tb;
