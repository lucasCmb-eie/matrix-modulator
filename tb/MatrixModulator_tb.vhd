LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
use std.env.finish;

 
ENTITY MatrixModulator_tb IS
END MatrixModulator_tb;

architecture Behavioral of MatrixModulator_tb is

    component MatrixModulator_top
        port(
        clk   : in std_logic;
        reset : in std_logic );
    end component;
    
    signal CLK : std_logic;
    signal RESET : std_logic;


begin
    
    uut: MatrixModulator_top PORT MAP (
        clk => CLK,
        reset => RESET        
    );
    
end;