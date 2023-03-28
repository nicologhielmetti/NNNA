-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_top_set is
port (
    ap_ready : OUT STD_LOGIC;
    this_v_read : IN STD_LOGIC_VECTOR (63 downto 0);
    x : IN STD_LOGIC_VECTOR (0 downto 0);
    value_r : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (63 downto 0) );
end;


architecture behav of add_top_set is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_logic_0 : STD_LOGIC := '0';

attribute shreg_extract : string;
    signal tmp_fu_42_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_fu_38_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln1_fu_60_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal or_ln_fu_52_p3 : STD_LOGIC_VECTOR (63 downto 0);


begin



    ap_ready <= ap_const_logic_1;
    ap_return <= 
        or_ln1_fu_60_p3 when (x(0) = '1') else 
        or_ln_fu_52_p3;
    empty_fu_38_p1 <= this_v_read(32 - 1 downto 0);
    or_ln1_fu_60_p3 <= (value_r & empty_fu_38_p1);
    or_ln_fu_52_p3 <= (tmp_fu_42_p4 & value_r);
    tmp_fu_42_p4 <= this_v_read(63 downto 32);
end behav;
