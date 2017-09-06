----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:12:06 11/27/2015 
-- Design Name: 
-- Module Name:    LAB6 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LAB6 is
    Port ( AB : in  std_logic_vector (7 downto 0);
           BUT1 : in  std_logic;
			  BUT2 : in  std_logic;
			  BUT3 : in  std_logic;
           D1 : out  std_logic_vector (6 downto 0);
			  D2 : out  std_logic_vector (7 downto 0);
			  GND1: out std_logic_vector (2 downto 0);
			  VCC1: out std_logic_vector (6 downto 0));
end LAB6;

architecture Behavioral of LAB6 is
signal Q1,Q2,Q3,numbA,numbB,DATA2: std_logic_vector(7 downto 0);
signal DATA1:	std_logic_vector(6 downto 0);
begin
GND1 <="000";
VCC1	<="1111111";
process(AB,BUT1,BUT2,BUT3)
begin
Q1<= AB;
if (BUT1='1') then
numbA<=Q1;
elsif (BUT2='1') then
numbB<=Q1;
elsif (BUT3='1') then
	case Q1 is
		when "00000000" =>Q2<= numbA xor numbB;
		when "00000001" =>Q2<= numbA and numbB;
		when "00000010" =>Q2<= numbA nand numbB;
		when others => Q2 <="00000000";
	end case;
	Q1<=Q2;
end if; 

Q3<=Q1 and "00001111";

	case Q3 is
		when "00000000" =>DATA2<="11000000";	--0
		when "00000001" =>DATA2<="11111001";	--1
		when "00000010" =>DATA2<="10100100";	--2
		when "00000011" =>DATA2<="10110000";	--3
		when "00000100" =>DATA2<="10011001";	--4
		when "00000101" =>DATA2<="10010010";	--5	
		when "00000110" =>DATA2<="10000010";	--6	
		when "00000111" =>DATA2<="11111000";	--7	
		when "00001000" =>DATA2<="10000000";	--8
		when "00001001" =>DATA2<="10010000";	--9
		when "00001010" =>DATA2<="10001000";	--A
		when "00001011" =>DATA2<="10000000";	--B
		when "00001100" =>DATA2<="11000110";	--C
		when "00001101" =>DATA2<="11000000";	--D
		when "00001110" =>DATA2<="10000110";	--E
		when "00001111" =>DATA2<="10001110";	--F
		when others => DATA2 <="00000000";
	end case;

Q3<=Q1 and "11110000";
		
	case Q3 is
		when "00000000" =>DATA1<="1000000";	--0
		when "00010000" =>DATA1<="1111001";	--1
		when "00100000" =>DATA1<="0100100";	--2
		when "00110000" =>DATA1<="0110000";	--3
		when "01000000" =>DATA1<="0011001";	--4
		when "01010000" =>DATA1<="0010010";	--5	
		when "01100000" =>DATA1<="0000010";	--6	
		when "01110000" =>DATA1<="1111000";	--7	
		when "10000000" =>DATA1<="0000000";	--8
		when "10010000" =>DATA1<="0010000";	--9
		when "10100000" =>DATA1<="0001000";	--A
		when "10110000" =>DATA1<="0000000";	--B
		when "11000000" =>DATA1<="1000110";	--C
		when "11010000" =>DATA1<="1000000";	--D
		when "11100000" =>DATA1<="0000110";	--E
		when "11110000" =>DATA1<="0001110";	--F
		when others => DATA1 <="0000000";
	end case;
		
D1<=DATA1;
D2<=DATA2;

end process;
end Behavioral;

