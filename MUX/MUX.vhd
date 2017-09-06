----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:13:16 10/29/2015 
-- Design Name: 
-- Module Name:    MUX1 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX1 is
    Port ( X0 : in  STD_LOGIC;
           X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           X3 : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (1 downto 0);
           OE : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end MUX1;

architecture Behavioral of MUX1 is
begin
	muxx:process(X0,X1,X2,X3,A,OE)
	begin
	if(OE='1') then
		case(A)is
			when "00"=>Y<=X0;
			when "01"=>Y<=X1;
			when "10"=>Y<=X2;
			when others=>Y<=X3;
		end case ; 
		else Y<='Z';
		end if;
	end process muxx;
end Behavioral;

