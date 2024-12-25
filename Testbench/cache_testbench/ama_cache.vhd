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

entity ama_cache is
    Port ( address : in  STD_LOGIC_VECTOR(9 downto 0);
           wr : in STD_LOGIC;
           clk : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR(11 downto 0);
           data_out : out  STD_LOGIC_VECTOR(11 downto 0);
           hit_miss: out STD_LOGIC
           );
end ama_cache;

architecture Behavioral of ama_cache is
	 
    type data_array_data is array (31 downto 0) of STD_LOGIC_VECTOR (33 downto 0);
    signal data_array: data_array_data := (others => (others => 'U'));
    signal index: STD_LOGIC_VECTOR(4 downto 0);
    signal tag: STD_LOGIC_VECTOR(4 downto 0);

    signal tagA: STD_LOGIC_VECTOR(4 downto 0);
    signal dataA: STD_LOGIC_VECTOR(16 downto 0);
    signal tagB: STD_LOGIC_VECTOR(4 downto 0);
    signal dataB: STD_LOGIC_VECTOR(11 downto 0);
    signal row: STD_LOGIC_VECTOR(33 downto 0);

begin
	 
    process (clk) begin
	
        if (wr = '0') then
            for i in 0 to 9 loop
                if (i < 5) then
                    index(i) <= address(i);
                else
                    tag(i-5) <= address(i);
                end if;
            end loop;
			
            row <= data_array(to_integer(unsigned(index)));
			
            for i in 0 to 4 loop
                tagA(i) <= row(i);
            end loop;
			
            for i in 5 to 16 loop
                dataA(i-5) <= row(i);
            end loop;
			
            for i in 17 to 21 loop
                tagB(i-17) <= row(i);
            end loop;
			
            for i in 22 to 33 loop
                dataB(i-22) <= row(i);
            end loop;
				
				if (tag = tagA) then
					data_out <= dataA;
					hit_miss <= '1';
				elsif (tag = tagB) then
					data_out <= dataB;
					hit_miss <= '1';
				else
					hit_miss <= '0';
					
				end if;
				
								
			
        end if;
		  
		  if ( wr = '1') then
		  
            for i in 0 to 9 loop
                if (i < 5) then
                    index(i) <= address(i);
                else
                    tag(i-5) <= address(i);
                end if;
            end loop;
			
            row <= data_array(to_integer(unsigned(index)));
				
            for i in 0 to 4 loop
                tagA(i) <= row(i);
            end loop;
			
            for i in 5 to 16 loop
                dataA(i-5) <= row(i);
            end loop;
			
            for i in 17 to 21 loop
                tagB(i-17) <= row(i);
            end loop;
			
            for i in 22 to 33 loop
                dataB(i-22) <= row(i);
            end loop;
				
				
				if dataA'length = 0 then
				
					tagA <= tag ;
					for j in 0 to 4 loop
						row(j) <= tagA(j);
					end loop;
					for j in 5 to 16 loop
						row(j) <= data_in(j-5);
					end loop;
					
						
				elsif dataB'length = 0 then
				
					tagB <= tag;
					for j in 17 to 21 loop
						row(j) <= tagB(j);
					end loop;
					for j in 22 to 33 loop
						row(j) <= data_in(j-5);
					end loop;

				else
				
					for j in 0 to 4 loop
						row(j) <= tagB(j);
					end loop;
					for j in 5 to 16 loop
						row(j) <= dataB(j-5);
					end loop;
					
					
					for j in 17 to 21 loop
						row(j) <= tag(j-17);
					end loop;
					for j in 22 to 33 loop
						row(j) <= data_in(j-22);
					end loop;
					
						
				end if;
				
				data_array(to_integer(unsigned(index))) <= row;
			end if;

    end process;

end Behavioral;