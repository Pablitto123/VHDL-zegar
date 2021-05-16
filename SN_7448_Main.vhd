----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:49:25 05/16/2021 
-- Design Name: 
-- Module Name:    SN_7448_Main - Behavioral 
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
entity SN_7448_Main is
Port ( A : in STD_LOGIC;
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D in STD_LOGIC;
		LT : in STD_LOGIC;
		RBI : in STD_LOGIC;
		CA : out STD_LOGIC;
		CB : out STD_LOGIC;
		CC : out STD_LOGIC;
		CD : out STD_LOGIC;	
		CE : out STD_LOGIC;
		CF : out STD_LOGIC;
		CG : out STD_LOGIC;
		BI_RBO : inout STD_LOGIC );
end SN_7448_Main;


architecture Behavioral of SN_7448_Main is
	signal BCDin : STD_LOGIC_VECTOR (3 downto 0);
	signal Seven_Segment : STD_LOGIC_VECTOR (6 downto 0);
begin
	process(A, B, C, D, LT, RBI)
	begin
		BCDin <= D & C & B & A;
		if ( LT = '0' ) then
		Seven_Segment <= "1111111";
		BI_RBO <= '1';
		else
				if ( RBI = '0' and BCDin = "0000" ) then
					Seven_Segment <= "0000000";
					BI_RBO <= '0';
				else
			case BCDin is
				when "0000" => Seven_Segment <= "1111110"; ---0
				when "0001" => Seven_Segment <= "0110000"; ---1
				when "0010" => Seven_Segment <= "1101101"; ---2
				when "0011" => Seven_Segment <= "1111001"; ---3
				when "0100" => Seven_Segment <= "0110011"; ---4
				when "0101" => Seven_Segment <= "1011011"; ---5
				when "0110" => Seven_Segment <= "1011111"; ---6
				when "0111" => Seven_Segment <= "1110000"; ---7
				when "1000" => Seven_Segment <= "1111111"; ---8
				when "1001" => Seven_Segment <= "1111011"; ---9
				when others => Seven_Segment <= "0000000"; ---null
			end case;
			BI_RBO <= '1';
			end if;
		end if;
		CA <= Seven_Segment(6);
		CB <= Seven_Segment(5);
		CC <= Seven_Segment(4);
		CD <= Seven_Segment(3);
		CE <= Seven_Segment(2);
		CF <= Seven_Segment(1);
		CG <= Seven_Segment(0);
	end process;
end Behavioral;
