--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:24:04 10/03/2022
-- Design Name:   
-- Module Name:   /home/sergio/temp/Xilinx/Matrix/Testeo_00.vhd
-- Project Name:  Matrix
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: modulator
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
use std.env.finish;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY modulador_tb IS
END modulador_tb;
 
ARCHITECTURE behavior OF modulador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT modulator
    PORT( 
         PUL_DOWN : IN  std_logic;
         PUL_UP : IN  std_logic;
         REG_DOWN : IN  std_logic;
         REG_UP : IN  std_logic;
         RELOJ  : IN  std_logic;
         AL_O   : IN        std_logic_vector(10 downto 0);
		 BE_I   : IN        std_logic_vector  (10 downto 0);
		 Q_I    : IN        std_logic_vector (8 downto 0);
		 PHI_I  : IN        std_logic_vector (10 downto 0);
         RELOJ00 : OUT  std_logic;
         AUXI00 : OUT  std_logic;
         AUXI01 : OUT  std_logic;
         AUXI02 : OUT  std_logic;
         AUXI03 : OUT  std_logic;
         AUXI04 : OUT  std_logic;
         SELECTOR : IN  std_logic_vector(7 downto 0);
         DIGITO : OUT  std_logic_vector(3 downto 0);
         SEGMENTO : OUT  std_logic_vector(7 downto 0);
         LED : OUT  std_logic_vector(7 downto 0);
         CE1 : OUT  std_logic;
         CE2 : OUT  std_logic;
         LB1 : OUT  std_logic;
         LB2 : OUT  std_logic;
         UB1 : OUT  std_logic;
         UB2 : OUT  std_logic;
         OE : OUT  std_logic;
         WE : OUT  std_logic;
         DIRECCIONES : OUT  std_logic_vector(17 downto 0);
         DATOS : INOUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PUL_DOWN : std_logic := '0';
   signal PUL_UP : std_logic := '0';
   signal REG_DOWN : std_logic := '0';
   signal REG_UP : std_logic := '0';
   signal RELOJ : std_logic := '0';
   signal SELECTOR : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal DATOS : std_logic_vector(31 downto 0);

 	--Outputs
   signal RELOJ00 : std_logic;
   signal AUXI00 : std_logic;
   signal AUXI01 : std_logic;
   signal AUXI02 : std_logic;
   signal AUXI03 : std_logic;
   signal AUXI04 : std_logic;
   signal DIGITO : std_logic_vector(3 downto 0);
   signal SEGMENTO : std_logic_vector(7 downto 0);
   signal LED : std_logic_vector(7 downto 0);
   signal CE1 : std_logic;
   signal CE2 : std_logic;
   signal LB1 : std_logic;
   signal LB2 : std_logic;
   signal UB1 : std_logic;
   signal UB2 : std_logic;
   signal OE : std_logic;
   signal WE : std_logic;
   signal DIRECCIONES : std_logic_vector(17 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
   signal T1, T2, T3, T4, T5 ,T6 ,T7 ,T8 ,T9, T10, T11, T12, T13 :integer := 0;
   signal AL_O : std_logic_vector (10 downto 0) := "00000000000";
   signal BE_I : std_logic_vector (10 downto 0) := "00000000000";
   signal Q_I : std_logic_vector (8 downto 0) := "000000000";
   signal PHI_I : std_logic_vector (10 downto 0) := "00000000000";
   
   constant RELOJ_period : time := 20 ns;
 
   --Archivos I/O
   file ArchivoSalida : TEXT open WRITE_MODE is "/home/lucas/Documents/Proyecto_Fceia/proyecto_MatroxConm/proyecto_MatroxConm.srcs/sim_1/new/output.txt";
   file ArchivoEntrada : TEXT open READ_MODE is "/home/lucas/Documents/Proyecto_Fceia/proyecto_MatroxConm/proyecto_MatroxConm.srcs/sim_1/new/input.txt";
   
BEGIN
    
    
    
	-- Instantiate the Unit Under Test (UUT)
   uut: modulator PORT MAP (
          PUL_DOWN => PUL_DOWN,
          PUL_UP => PUL_UP,
          REG_DOWN => REG_DOWN,
          REG_UP => REG_UP,
          RELOJ => RELOJ,
          AL_O => AL_O,
          BE_I => BE_I,
          Q_I => Q_I,
          PHI_I => PHI_I,
          RELOJ00 => RELOJ00,
          AUXI00 => AUXI00,
          AUXI01 => AUXI01,
          AUXI02 => AUXI02,
          AUXI03 => AUXI03,
          AUXI04 => AUXI04,
          SELECTOR => SELECTOR,
          DIGITO => DIGITO,
          SEGMENTO => SEGMENTO,
          LED => LED,
          CE1 => CE1,
          CE2 => CE2,
          LB1 => LB1,
          LB2 => LB2,
          UB1 => UB1,
          UB2 => UB2,
          OE => OE,
          WE => WE,
          DIRECCIONES => DIRECCIONES,
          DATOS => DATOS
        );

   -- Clock process definitions
   RELOJ_process :process
   begin
		RELOJ <= '0';
		wait for RELOJ_period/2;
		RELOJ <= '1';
		wait for RELOJ_period/2;
   end process;
 
   MEDIDOR_TIEMPO :process(RELOJ, AUXI02)
   begin
       if(rising_edge(RELOJ)) then
            if DIRECCIONES(0) = '1' then
                T1 <= T1 + 1;
            end if;
            if DIRECCIONES(1) = '1' then
                T2 <= T2 + 1;
            end if;
            if DIRECCIONES(2) = '1' then
                T3 <= T3 + 1;
            end if;
            if DIRECCIONES(3) = '1' then
                T4 <= T4 + 1;
            end if;
            if DIRECCIONES(4) = '1' then
                T5 <= T5 + 1;
            end if;
            if DIRECCIONES(5) = '1' then
                T6 <= T6 + 1;
            end if;
            if DIRECCIONES(6) = '1' then
                T7 <= T7 + 1;
            end if;
            if DIRECCIONES(7) = '1' then
                T8 <= T8 + 1;
            end if;
            if DIRECCIONES(8) = '1' then
                T9 <= T9 + 1;
            end if;
            if DIRECCIONES(9) = '1' then
                T10 <= T10 + 1; 
            end if;
            if DIRECCIONES(10) = '1' then
                T11 <= T11 + 1;
            end if;
            if DIRECCIONES(11) = '1' then
                T12 <= T12 + 1;
            end if;
            if DIRECCIONES(12) = '1' then
                T13 <= T13 + 1;
            end if;
       end if;
       
       if(falling_edge(AUXI02)) then
            T1 <= 0;
            T2 <= 0;
            T3 <= 0;
            T4 <= 0;
            T5 <= 0;
            T6 <= 0;
            T7 <= 0;
            T8 <= 0;
            T9 <= 0;
            T10 <= 0;
            T11 <= 0;
            T12 <= 0;
            T13 <= 0;
       end if;
   end process;
   
--Lectura del archivo con datos de entrada
    LECTURA_process : process (AUXI02)
        variable line_input : line;
        variable param : string(1 downto 3);
        variable alo : std_logic_vector (10 downto 0);
        variable bei : std_logic_vector (10 downto 0);
        variable phi : std_logic_vector (10 downto 0);
        variable q : std_logic_vector (8 downto 0);
        
        begin
            if(endfile(ArchivoEntrada)) then
                report "Archivo entrada leido completamente";
            end if;
        
            if(rising_edge(AUXI02) and not endfile(ArchivoEntrada)) then
                readline(ArchivoEntrada, line_input);
                hread(line_input, alo);
                
                AL_O <= alo;
                --
                readline(ArchivoEntrada, line_input);
                hread(line_input, bei);
                
                BE_I <= bei;
                --
                readline(ArchivoEntrada, line_input);
                read(line_input, q);
                
                Q_I <= q;
                --
                readline(ArchivoEntrada, line_input);
                hread(line_input, phi);
                
                PHI_I <= phi;
                
                readline(ArchivoEntrada, line_input);
            end if;
    end process;
    
--Escritura del archivo de salida
    ESCRITURA_process : process (AUXI02)
    
        variable line_output : line;
        variable Ttot : integer :=0;
        
        begin
            if(rising_edge(AUXI02)) then
                Ttot := (T1 + T2 + T3 + T4 + T5 + T6 + T7 + T8 + T9 + T10 + T11 + T12 + T13); 
            
                write(line_output, string'("Valores Direcciones, "));
                write(line_output, string'("multiplicar por 0.02 ns para obtener valor temporal"));
                writeline(ArchivoSalida, line_output);
                
                write(line_output, string'("N1: "));
                write(line_output, T1);
                writeline(ArchivoSalida, line_output);
                
                write(line_output, string'("N2: "));
                write(line_output, T2);
                writeline(ArchivoSalida, line_output);
                
                write(line_output, string'("N3: "));
                write(line_output, T3);
                writeline(ArchivoSalida, line_output);
                
                write(line_output, string'("N4: "));
                write(line_output, T4);                
                writeline(ArchivoSalida, line_output);
                
                write(line_output, string'("N5: "));
                write(line_output, T5);              
                writeline(ArchivoSalida, line_output);

                write(line_output, string'("N6: "));
                write(line_output, T6);
                writeline(ArchivoSalida, line_output);

                write(line_output, string'("N7: "));
                write(line_output, T7);
                writeline(ArchivoSalida, line_output);

                write(line_output, string'("N8: "));
                write(line_output, T8);
                writeline(ArchivoSalida, line_output);
                
                write(line_output, string'("N9: "));
                write(line_output, T9);
                writeline(ArchivoSalida, line_output);
                
                write(line_output, string'("N10: "));
                write(line_output, T10);
                writeline(ArchivoSalida, line_output);
    
                write(line_output, string'("N11: "));
                write(line_output, T11);
                writeline(ArchivoSalida, line_output);

                write(line_output, string'("N12: "));
                write(line_output, T12);
                writeline(ArchivoSalida, line_output);
            
                write(line_output, string'("N13: "));
                write(line_output, T13);
                writeline(ArchivoSalida, line_output);
                
                write(line_output, string'("Ntot: "));
                write(line_output, Ttot);
                writeline(ArchivoSalida, line_output);
                Ttot := 0;
            end if;
            
    end process;


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--		AUXI00 <= '0';
      wait for 100 ns;	

      wait for RELOJ_period*10;

      -- insert stimulus here 
      wait for RELOJ_period*10;
--		AUXI00 <= '1';
--		wait for 30 ns;	
--		AUXI00 <= '0';

      wait;
   end process;

END;
