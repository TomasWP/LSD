-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "06/02/2022 23:00:08"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Contador IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	pointA : IN std_logic;
	pointB : IN std_logic;
	countA : OUT std_logic_vector(1 DOWNTO 0);
	countB : OUT std_logic_vector(1 DOWNTO 0)
	);
END Contador;

ARCHITECTURE structure OF Contador IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_pointA : std_logic;
SIGNAL ww_pointB : std_logic;
SIGNAL ww_countA : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_countB : std_logic_vector(1 DOWNTO 0);
SIGNAL \countA[0]~output_o\ : std_logic;
SIGNAL \countA[1]~output_o\ : std_logic;
SIGNAL \countB[0]~output_o\ : std_logic;
SIGNAL \countB[1]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \s_countA~0_combout\ : std_logic;
SIGNAL \pointA~input_o\ : std_logic;
SIGNAL \s_countA[0]~1_combout\ : std_logic;
SIGNAL \s_countA~2_combout\ : std_logic;
SIGNAL \s_countB~0_combout\ : std_logic;
SIGNAL \pointB~input_o\ : std_logic;
SIGNAL \s_countB[0]~1_combout\ : std_logic;
SIGNAL \s_countB~2_combout\ : std_logic;
SIGNAL s_countA : std_logic_vector(1 DOWNTO 0);
SIGNAL s_countB : std_logic_vector(1 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_pointA <= pointA;
ww_pointB <= pointB;
countA <= ww_countA;
countB <= ww_countB;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\countA[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_countA(0),
	devoe => ww_devoe,
	o => \countA[0]~output_o\);

\countA[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_countA(1),
	devoe => ww_devoe,
	o => \countA[1]~output_o\);

\countB[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_countB(0),
	devoe => ww_devoe,
	o => \countB[0]~output_o\);

\countB[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_countB(1),
	devoe => ww_devoe,
	o => \countB[1]~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\s_countA~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_countA~0_combout\ = (!s_countA(0) & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_countA(0),
	datab => \reset~input_o\,
	combout => \s_countA~0_combout\);

\pointA~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pointA,
	o => \pointA~input_o\);

\s_countA[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_countA[0]~1_combout\ = (\reset~input_o\) # (!\pointA~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pointA~input_o\,
	datad => \reset~input_o\,
	combout => \s_countA[0]~1_combout\);

\s_countA[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_countA~0_combout\,
	ena => \s_countA[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_countA(0));

\s_countA~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_countA~2_combout\ = (!\reset~input_o\ & (s_countA(0) $ (s_countA(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_countA(0),
	datac => s_countA(1),
	datad => \reset~input_o\,
	combout => \s_countA~2_combout\);

\s_countA[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_countA~2_combout\,
	ena => \s_countA[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_countA(1));

\s_countB~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_countB~0_combout\ = (!s_countB(0) & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_countB(0),
	datab => \reset~input_o\,
	combout => \s_countB~0_combout\);

\pointB~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pointB,
	o => \pointB~input_o\);

\s_countB[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_countB[0]~1_combout\ = (\reset~input_o\) # ((!\pointB~input_o\ & \pointA~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pointB~input_o\,
	datac => \pointA~input_o\,
	datad => \reset~input_o\,
	combout => \s_countB[0]~1_combout\);

\s_countB[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_countB~0_combout\,
	ena => \s_countB[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_countB(0));

\s_countB~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_countB~2_combout\ = (!\reset~input_o\ & (s_countB(0) $ (s_countB(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_countB(0),
	datac => s_countB(1),
	datad => \reset~input_o\,
	combout => \s_countB~2_combout\);

\s_countB[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_countB~2_combout\,
	ena => \s_countB[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_countB(1));

ww_countA(0) <= \countA[0]~output_o\;

ww_countA(1) <= \countA[1]~output_o\;

ww_countB(0) <= \countB[0]~output_o\;

ww_countB(1) <= \countB[1]~output_o\;
END structure;


