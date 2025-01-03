--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:38:19 12/29/2023
-- Design Name:   
-- Module Name:   C:/Users/Morteza/Desktop/Projects/ama_cache/ram_testbench.vhd
-- Project Name:  ama_cache
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ama_ram
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ram_testbench IS
END ram_testbench;
 
ARCHITECTURE behavior OF ram_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ama_ram
    PORT(
         rd : IN  std_logic;
         clk : IN  std_logic;
         address : IN  std_logic_vector(9 downto 0);
         data_out : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic := '0';
   signal clk : std_logic := '0';
   signal address : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ama_ram PORT MAP (
          rd => rd,
          clk => clk,
          address => address,
          data_out => data_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		rd <= '1';
		
		address <= "0000000000";

      wait for clk_period*10;

      wait;
   end process;

END;
