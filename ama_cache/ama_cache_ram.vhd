library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ama_cache_ram is
    Port ( clk : in STD_LOGIC;
       rd : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (9 downto 0);
           result : out STD_LOGIC_VECTOR (11 downto 0);
			  hit : out STD_LOGIC
			  );
end ama_cache_ram;

architecture Behavioral of ama_cache_ram is

signal cache_data_out : std_logic_vector(11 downto 0);

component ama_cache is 
    port ( address : in STD_LOGIC_VECTOR(9 downto 0);
           wr : in STD_LOGIC;
           clk : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(11 downto 0);
           data_out : out STD_LOGIC_VECTOR(11 downto 0);
           hit_miss: out STD_LOGIC
           );
end component;

signal ram_data_out : std_logic_vector(11 downto 0);

component ama_ram is
    port ( rd : in STD_LOGIC;
       clk : in STD_LOGIC;
          address : in STD_LOGIC_VECTOR(9 downto 0);
           data_out : out STD_LOGIC_VECTOR(11 downto 0)
			  );
end component;

signal hit_miss_result: STD_LOGIC := '0';

signal red : STD_LOGIC := '0';
signal wrt : STD_LOGIC := '0';
signal data : STD_LOGIC_VECTOR(11 downto 0) := "000000000000";

begin

cache: ama_cache port map (
        address => address,
        wr => wrt,
        clk => clk,
        data_in => data,
        data_out => cache_data_out,
        hit_miss => hit_miss_result
);

hit <= hit_miss_result;

ram : ama_ram port map(
        rd => red,
        clk => clk,
        address => address,
        data_out => ram_data_out
);

process (clk) begin
	if (hit_miss_result = '0') then
		red <= '1';
		data <= ram_data_out;
	   wrt <= '1';
		result <= ram_data_out;
	else
		result <= cache_data_out;		

	end if;

end process;

end Behavioral;