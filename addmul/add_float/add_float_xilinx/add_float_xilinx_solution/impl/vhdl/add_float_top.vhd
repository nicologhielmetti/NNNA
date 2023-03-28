-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_float_top is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    a : IN STD_LOGIC_VECTOR (127 downto 0);
    b : IN STD_LOGIC_VECTOR (127 downto 0);
    res : OUT STD_LOGIC_VECTOR (127 downto 0);
    res_ap_vld : OUT STD_LOGIC );
end;


architecture behav of add_float_top is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "add_float_top_add_float_top,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=50.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=33.828375,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=465,HLS_SYN_LUT=3581,HLS_VERSION=2022_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal trunc_ln691_fu_57_p1 : STD_LOGIC_VECTOR (71 downto 0);
    signal trunc_ln691_reg_72 : STD_LOGIC_VECTOR (71 downto 0);
    signal trunc_ln691_1_fu_62_p1 : STD_LOGIC_VECTOR (71 downto 0);
    signal trunc_ln691_1_reg_77 : STD_LOGIC_VECTOR (71 downto 0);
    signal grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_start : STD_LOGIC;
    signal grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done : STD_LOGIC;
    signal grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_idle : STD_LOGIC;
    signal grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_ready : STD_LOGIC;
    signal grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_return : STD_LOGIC_VECTOR (95 downto 0);
    signal grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component add_float_top_plus_minus_25_2_8_0_25_2_8_0_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        p_read : IN STD_LOGIC_VECTOR (71 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (71 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (95 downto 0) );
    end component;



begin
    grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49 : component add_float_top_plus_minus_25_2_8_0_25_2_8_0_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_start,
        ap_done => grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done,
        ap_idle => grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_idle,
        ap_ready => grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_ready,
        p_read => trunc_ln691_reg_72,
        p_read1 => trunc_ln691_1_reg_77,
        ap_return => grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_return);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_ready = ap_const_logic_1)) then 
                    grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                trunc_ln691_1_reg_77 <= trunc_ln691_1_fu_62_p1;
                trunc_ln691_reg_72 <= trunc_ln691_fu_57_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done)
    begin
        if ((grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done, ap_CS_fsm_state2)
    begin
        if (((grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done, ap_CS_fsm_state2)
    begin
        if (((grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_start <= grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_start_reg;
    res <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_return),128));

    res_ap_vld_assign_proc : process(grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done, ap_CS_fsm_state2)
    begin
        if (((grp_plus_minus_25_2_8_0_25_2_8_0_s_fu_49_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            res_ap_vld <= ap_const_logic_1;
        else 
            res_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    trunc_ln691_1_fu_62_p1 <= b(72 - 1 downto 0);
    trunc_ln691_fu_57_p1 <= a(72 - 1 downto 0);
end behav;