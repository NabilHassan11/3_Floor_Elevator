----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Nabil Hesham Hassan & Amr Wael Mahgoub
-- 
-- Create Date: 12/22/2022 01:47:28 PM
-- Design Name: 
-- Module Name: Elevator - Behavioral
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

entity Elevator is
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
end Elevator;

architecture Behavioral of Elevator is
type state_type is (S1,S2,S3,S12,S13,S21,S23,S31,S32);
signal current_state: state_type;
signal clk_counter: natural range 0 to 200000000 := 0;
signal E,up,down : STD_LOGIC:= '0';
signal F1,F2,F3 : boolean:=false;

begin
    clk_process : process(clk,reset,sensor1,sensor2,sensor2,sensor_2,sensor3,
    BTN1,BTN_1,BTN2,BTN_2,BTN3,BTN_3)
    begin
         if reset = '1' then current_state <= S1;
         
         elsif(clk'event and clk = '1') then
            case current_state is
            
            
                when S1=>
--                    test<='1';
                    if(BTN1 = '1' or BTN_1 = '1') then  current_state<=S1;
                    elsif(BTN2 = '1' or BTN_2 = '1') then  current_state<=S12;
                    elsif(F2)then
                        clk_counter <= clk_counter+1;
                        if(clk_counter>=200000000) then
                            clk_counter<=0;
                            current_state<=S12;
                            F2 <= false;
                        end if;
                    elsif(BTN3 = '1' or BTN_3 = '1') then current_state<=S13;
                    elsif (F3) then 
                        clk_counter <= clk_counter+1;
                        if(clk_counter>=200000000) then
                            clk_counter<=0;
                            current_state<=S13;
                            F3 <= false;
                        end if;
                    elsif(sensor1 ='0') then current_state<=S1;
                    else current_state<=S1; 
                    end if;
                    
                    
                when S2=>
                    if(BTN1 = '1' or BTN_1 = '1') then current_state<=S21;
                    elsif(F1) then
                        clk_counter <= clk_counter+1;
                        if(clk_counter>=200000000) then
                            clk_counter<=0;
                            current_state<=S21;
                            F1 <= false;
                        end if;
                    elsif(BTN2 = '1' or BTN_2 = '1') then current_state<=S2;
                    elsif(BTN3 = '1' or BTN_3 = '1') then current_state<=S23;
                    elsif(F3) then
                        clk_counter <= clk_counter+1;
                        if(clk_counter>=200000000) then
                            clk_counter<=0;
                            current_state<=S23;
                            F1 <= false;
                        end if;                    
                    elsif(sensor2 ='0' and sensor_2 ='0' ) then current_state<=S2;
                    else current_state<=S2; 
                    end if;
                    
                    
                when S3=>
                    if(BTN1 = '1' or BTN_1 = '1') then current_state<=S31;
                    elsif(F2) then
                        clk_counter <= clk_counter+1;
                        if(clk_counter>=200000000) then
                            clk_counter<=0;
                            current_state<=S32;
                            F2 <= false;
                        end if;
                    elsif(BTN2 = '1' or BTN_2 = '1') then current_state<=S32;
                    elsif(F1) then
                        clk_counter <= clk_counter+1;
                        if(clk_counter>=200000000) then
                            clk_counter<=0;
                            current_state<=S31;
                            F1 <= false;
                        end if;
                    elsif(sensor3 ='0') then current_state<=S3;
                    else current_state<=S3;
                    end if;
                    
                 when S12=>
--                    while(sensor2 = '1' or sensor_2 = '1') loop
--                        Motor_Enable <= '1'; ccw <='1'; cw<='0';
--                        if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
--                        elsif (BTN3 = '1' or BTN_3 = '1') then F3<=true;
--                        end if;
--                    end loop;
--                    Motor_Enable <= '0';
                    if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
                    end if;
                    if (BTN3 = '1' or BTN_3 = '1') then F3 <= true;
                    end if;
                    if(sensor2 = '0' and sensor_2 = '0') then
                        current_state <= S2;
                    end if;
                   
                   
                 when S13 =>  
--                     while(sensor3 = '1') loop
--                         Motor_Enable <= '1'; ccw <='1'; cw<='0';
--                         if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
--                         elsif (BTN2 = '1' or BTN_2 = '1') then F2<=true;
--                         end if;
--                     end loop;
--                     Motor_Enable <= '0';
                    if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
                    end if;
                    if (BTN2 = '1' or BTN_2 = '1') then F2 <=true;
                    end if;
                    if(sensor3 = '0') then
                        current_state <= S3 ;
                    end if;
                       
                       
                 when S21 =>
--                     while(sensor1 ='1') loop
--                         Motor_Enable <= '1'; ccw <='0'; cw<='1';
--                         if(BTN2 = '1' or BTN_2 = '1') then F2 <= true;
--                         elsif (BTN3 = '1' or BTN_3 = '1') then F3<=true;
--                         end if;
--                     end loop;
--                     Motor_Enable <= '0';
                    if(BTN2 = '1' or BTN_2 = '1') then F2 <= true;
                    end if;
                    if (BTN3 = '1' or BTN_3 = '1') then F3<=true;
                    end if;
                     if(sensor1 = '0') then  
                         current_state <= S1 ;
                     end if;
                       
                       
                 when S23 =>
--                    while(sensor3 ='1') loop
--                        Motor_Enable <= '1'; ccw <='1'; cw<='0';
--                        if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
--                        elsif (BTN2 = '1' or BTN_2 = '1') then F2<=true;
--                        end if;
--                    end loop;
--                    Motor_Enable <= '0';
                    if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
                    end if;
                    if (BTN2 = '1' or BTN_2 = '1') then F2 <=true;
                    end if;
                    if(sensor3 = '0') then
                        current_state <= S3 ;
                    end if; 
                      
                      
                 when S31 =>
--                    while(sensor1 ='1') loop
--                        Motor_Enable <= '1'; ccw <='0'; cw<='1';
--                        if(BTN2 = '1' or BTN_2 = '1') then F2 <= true;
--                        elsif (BTN3 = '1' or BTN_3 = '1') then F3<=true;
--                        end if;
--                    end loop;
--                    Motor_Enable <= '0';
                    if(BTN2 = '1' or BTN_2 = '1') then F2 <= true;
                    end if;
                    if (BTN3 = '1' or BTN_3 = '1') then F3<=true;
                    end if;
                    if(sensor1 = '0') then
                         current_state <= S1 ;
                    end if;
                      
                      
                 when S32 =>
--                     while(sensor2 = '1' or sensor_2 = '1') loop
--                         Motor_Enable <= '1'; ccw <='0'; cw<='1';
--                         if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
--                         elsif (BTN3 = '1' or BTN_3 = '1') then F3<=true;
--                         end if;
--                     end loop;
--                     Motor_Enable <= '0';
                    if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
                    end if;
                    if (BTN3 = '1' or BTN_3 = '1') then F3<=true;
                    end if;
                    if(sensor2 = '0' and sensor_2 = '0') then
                        current_state <= S2 ; 
                    end if;
            end case;
        end if;
    end process;
    
    state_process: process(current_state ,sensor1,sensor2,sensor_2,sensor3)
    begin
        case current_state is
        
        
            when S12=>
--                while(sensor2 = '1' or sensor_2 = '1') loop
                if(sensor_2 = '1' or sensor2 = '1' ) then
                    E <= '1'; up <='1'; down<='0';
--                end if;
--                    if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
--                    end if;
--                    if (BTN3 = '1' or BTN_3 = '1') then F3<=true;
--                    end if;
--                end loop;
--                if( sensor_2 = '0') then
                elsif (sensor_2 = '0' and sensor2 = '0') then
                    E <= '0';
                end if;
                
                
            when S13 =>  
--                test <='0';
--                while(sensor3 = '1') loop
                if(sensor3 = '1')then
                    E <= '1'; up <='1'; down<='0';
                end if;
--                    if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
--                    end if;
--                    if (BTN2 = '1' or BTN_2 = '1') then F2<=true;
--                    end if;
--                end loop;
                if(sensor3 = '0') then
                    E <= '0';
                end if;
                
                
            when S21 =>
--                while(sensor1 ='1') loop
                if(sensor1 = '1') then
                    E <= '1'; up <='0'; down<='1';
                end if;
--                    if(BTN2 = '1' or BTN_2 = '1') then F2 <= true;
--                    end if;
--                    if (BTN3 = '1' or BTN_3 = '1') then F3<=true;
--                    end if;
--                end loop;
                if(sensor1 = '0') then
                    E <= '0';
                end if;
                
                
            when S23 =>
--               while(sensor3 ='1') loop
               if(sensor3 = '1') then
                   E <= '1'; up <='1'; down<='0';
               end if;
--                   if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
--                   end if;
--                   if (BTN2 = '1' or BTN_2 = '1') then F2<=true;
--                   end if;
--               end loop;
               if(sensor3 = '0') then
                    E <= '0';
               end if; 
               
            when S31 =>
--               while(sensor1 ='1') loop
                if(sensor1 ='1') then
                    E <= '1'; up <='0'; down<='1';
                end if;
--                    if(BTN2 = '1' or BTN_2 = '1') then F2 <= true;
--                    end if;
--                    if (BTN3 = '1' or BTN_3 = '1') then F3<=true;
--                    end if;
--               end loop;
               if(sensor1 = '0') then
                    E <= '0';
               end if;
               
               
            when S32 =>
--                while(sensor2 = '1' or sensor_2 = '1') loop
                if(sensor_2 = '1' or sensor2 = '1' ) then
                    E <= '1'; up <='0'; down<='1';
--                end if;
--                    if(BTN1 = '1' or BTN_1 = '1') then F1 <= true;
--                    end if;
--                    if (BTN3 = '1' or BTN_3 = '1') then F3<=true;
--                    end if;
--                end loop;
--                if( sensor_2 = '0') then
                elsif (sensor_2 = '0' and sensor2 = '0') then
                    E <= '0';
                end if;
            when others => 
                E <= '0'; up <='0'; down<='0';
        end case;
            
    end process;
    Motor_Enable<=E;
    ccw <= up;
    cw <= down;
    



end Behavioral;