--! @title non_project_mode_example
--! @file top_level.vhd
--! @author Joseph Pierce Vincent (josephpiercevincent@gmail.com)
--! @version 0.1
--! @date 2021-08-28
--!
--! @brief This is a basic example of a non project mode workflow.
--! Set for the ZCU102, this module will synthesize to light LEDs 
--! on the click of a pushbutton.

library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.NUMERIC_STD.ALL;

entity turnOn_Leds is
  Port ( 
    PB_IN : in STD_LOGIC_VECTOR(4 downto 0); --! Incoming Pushbuttons (0-LS 1-RS 2-US 3-DS 4-MS) 
    LEDS_OUT : out STD_LOGIC_VECTOR(4 downto 0)  --! LEDs out light based on the pushbutton pressed (0-LS 1-RS 2-US 3-DS 4-MS).
  );
end turnOn_Leds;

architecture Behavioral of turnOn_Leds is

begin

LEDS_OUT <= PB_IN;

end Behavioral;