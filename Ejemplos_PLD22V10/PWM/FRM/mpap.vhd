LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY pwm_generator IS
    PORT (
        clk : IN std_logic;
        duty_cycle : IN std_logic_vector(3 DOWNTO 0);  -- Ciclo de trabajo de 0 a 15
        pwm_out : OUT std_logic
    );

	attribute LOC : string ;
-- Asignacion de pines de entrada
	attribute LOC of clk          : signal is "P1"; 
	attribute LOC of duty_cycle   : signal is "P2P3P4P5"; 
-- Asignacion de pines de salida
	attribute LOC of pwm_out      : signal is "P23";

END pwm_generator;

ARCHITECTURE behavior OF pwm_generator IS
    SIGNAL counter : std_logic_vector(3 DOWNTO 0) := "0000";
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            counter <= counter + 1;
            IF counter < duty_cycle THEN
                pwm_out <= '1';
            ELSE
                pwm_out <= '0';
            END IF;
        END IF;
    END PROCESS;
END behavior;

