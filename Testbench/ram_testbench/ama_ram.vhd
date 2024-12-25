----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:37:01 12/23/2023 
-- Design Name: 
-- Module Name:    ama_ram - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ama_ram is
    Port ( rd : in STD_LOGIC;
			  clk : in  STD_LOGIC;
	        address : in  STD_LOGIC_VECTOR (9 downto 0);
           data_out : out  STD_LOGIC_VECTOR (11 downto 0)
			  );
end ama_ram;

architecture Behavioral of ama_ram is

type data_array_data is array (1023 downto 0) of STD_LOGIC_VECTOR (11 downto 0);
signal data_array: data_array_data;

constant data_array_init : data_array_data := (
        0  to 9  => "100010101000",
        10 to 19 => "010101010101",
        20 to 29 => "001100110011",
        30 to 39 => "111000111000",
        40 to 49 => "000111000111",
        50 to 59 => "101010101010",
        60 to 69 => "110011001100",
        70 to 79 => "011001100110",
        80 to 89 => "000000000001",
        90 to 99 => "111111111110",
        others   => (others => 'U')
    );
begin

data_array <= data_array_init;

process (clk) begin

	if rd = '1' then
		data_out <= data_array(to_integer(unsigned(address)));
	end if;

end process;

end Behavioral;