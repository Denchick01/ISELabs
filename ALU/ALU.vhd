------------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:46:52 11/24/2015 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



					

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           CE : in  STD_LOGIC;
           K : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out  STD_LOGIC;
           DATA : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is
signal Q1,Q2: bit_vector(7 downto 0);
signal Q3: STD_LOGIC_VECTOR(7 downto 0); 
begin
process (K,CE,A,B)
	variable Qt: integer; 
	begin
	if (CE = '1') then
		case K is
			when "0000" => Q3 <= A or B;
			when "0001" => Q3 <= A and B;
			when "0010" => Q3 <= A nor B;
			when "0011" => Q3 <= A xor B;
			when "0100" => Q3 <= not B;
			when "0101" => 
				Qt	:= conv_integer(A) + conv_integer(B);
				Q3 <= Conv_STD_LOGIC_VECTOR(Qt,8);
			when "0110" =>
				Qt:= conv_integer(A) - conv_integer(B);
				Q3 <= Conv_STD_LOGIC_VECTOR(Qt,8);
			when "0111" =>
				Qt:= conv_integer(A) * conv_integer(B);
				Q3 <= Conv_STD_LOGIC_VECTOR(Qt,8);
			when "1000" =>
				Qt := conv_integer(B);
				Q1<= to_bitvector(A);
				Q2<= Q1 srl Qt;
				Q3 <= to_stdlogicvector(Q2);
			when "1001" =>
				Qt:= conv_integer(B) - conv_integer(A);
				Q3 <= Conv_STD_LOGIC_VECTOR(Qt,8);
			when others => Q3 <="XXXXXXXX";
		end case;
	else Q3 <= "00000000";
	end if;
	if (Q3 = "00000000") then
		Z<='1';
	else z<='0';
	end if;
	DATA<=Q3;
end process;
end Behavioral;

