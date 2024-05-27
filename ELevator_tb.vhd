----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2022 05:49:19 PM
-- Design Name: 
-- Module Name: ELevator_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ELevator_tb is
--  Port ( );
end ELevator_tb;

architecture Behavioral of ELevator_tb is
    component Elevator is
        Port ( clk : in STD_LOGIC;
               reset:in STD_LOGIC;
               BTN1 : in STD_LOGIC;
               BTN2 : in STD_LOGIC;
               BTN3 : in STD_LOGIC;
               BTN_1 : in STD_LOGIC;
               BTN_2 : in STD_LOGIC;
               BTN_3 : in STD_LOGIC;
               sensor1 : in STD_LOGIC;
               sensor2 : in STD_LOGIC;
               sensor_2 : in STD_LOGIC;
               sensor3 : in STD_LOGIC;
               Motor_Enable : out STD_LOGIC;
               cw : out STD_LOGIC;
               ccw : out STD_LOGIC);
       end component;
       signal clk , reset,BTN1,BTN2,BTN3,BTN_1,BTN_2,BTN_3: STD_LOGIC:='0';
       signal sensor1,sensor2,sensor_2,sensor3: STD_LOGIC:='1';
       signal Motor_Enable ,cw,ccw: STD_LOGIC;

begin
    uut: Elevator port map(clk=>clk,reset=>reset,BTN1=>BTN1,BTN2=>BTN2,BTN3=>BTN3,BTN_1=>BTN_1
    ,BTN_2=>BTN_2,BTN_3=>BTN_3,sensor1=>sensor1,sensor2=>sensor2,sensor_2=>sensor_2,sensor3=>sensor3,
    Motor_Enable=>Motor_Enable,cw=>cw,ccw=>ccw);
    
    clk_process: process
    begin
        clk <= '0' ; wait for 100 ns;
        clk <= '1' ; wait for 100 ns;
    end process;
    
    stim_process: process
    begin 
        reset<='1' ;wait for 150ns;
        reset<='0'; wait for 150 ns;
        BTN2 <='1' ; wait for 10 ns;
        BTN2<='0'; wait for 100ns;
        sensor2 <='0' ;sensor_2 <='0' ; wait for 200ns;
        sensor2 <='1' ;sensor_2 <='1' ; wait for 100 ns;
--        BTN_2 <= '1'; wait for 100 ns;
--        BTN_2 <='0'; wait for 180 ns;
--        sensor2 <='0'; sensor_2 <='0'; wait for 100 ns;
--        sensor2 <='1'; sensor_2 <='1'; wait for 100 ns;
        wait;
    
    end process;
        

end Behavioral;
