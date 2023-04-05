-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fixed_to_float_top_convert_ac_fixed_ac_float_25_2_8_0_Pipeline_VITIS_LOOP_213 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    value_1 : IN STD_LOGIC_VECTOR (31 downto 0);
    value_r : IN STD_LOGIC_VECTOR (31 downto 0);
    sext_ln2137 : IN STD_LOGIC_VECTOR (0 downto 0);
    k_2_out : OUT STD_LOGIC_VECTOR (0 downto 0);
    k_2_out_ap_vld : OUT STD_LOGIC;
    select_ln678_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    select_ln678_out_ap_vld : OUT STD_LOGIC;
    ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of fixed_to_float_top_convert_ac_fixed_ac_float_25_2_8_0_Pipeline_VITIS_LOOP_213 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal icmp_ln2139_fu_141_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_fu_118_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_phi_mux_UnifiedRetVal_phi_fu_89_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal x_fu_50 : STD_LOGIC_VECTOR (1 downto 0);
    signal k_fu_147_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_k_2 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln678_fu_132_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln678_fu_126_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sext_ln2137_cast_fu_97_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component fixed_to_float_top_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component fixed_to_float_top_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





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


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv1_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1) and ((tmp_fu_118_p3 = ap_const_lv1_1) or (icmp_ln2139_fu_141_p2 = ap_const_lv1_0)))) then 
                    ap_return_preg <= ap_phi_mux_UnifiedRetVal_phi_fu_89_p4;
                end if; 
            end if;
        end if;
    end process;


    x_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1))) then
                if (((tmp_fu_118_p3 = ap_const_lv1_0) and (icmp_ln2139_fu_141_p2 = ap_const_lv1_1))) then 
                    x_fu_50 <= k_fu_147_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    x_fu_50 <= ap_const_lv2_1;
                end if;
            end if; 
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start_int)
    begin
        if ((ap_start_int = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start_int)
    begin
                ap_block_state1_pp0_stage0_iter0 <= (ap_start_int = ap_const_logic_0);
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_state1, icmp_ln2139_fu_141_p2, tmp_fu_118_p3, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1) and ((tmp_fu_118_p3 = ap_const_lv1_1) or (icmp_ln2139_fu_141_p2 = ap_const_lv1_0)))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_state1, ap_loop_exit_ready, ap_done_reg, ap_start_int)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_phi_mux_UnifiedRetVal_phi_fu_89_p4_assign_proc : process(ap_CS_fsm_state1, icmp_ln2139_fu_141_p2, tmp_fu_118_p3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
            if (((tmp_fu_118_p3 = ap_const_lv1_0) and (icmp_ln2139_fu_141_p2 = ap_const_lv1_0))) then 
                ap_phi_mux_UnifiedRetVal_phi_fu_89_p4 <= ap_const_lv1_0;
            elsif ((tmp_fu_118_p3 = ap_const_lv1_1)) then 
                ap_phi_mux_UnifiedRetVal_phi_fu_89_p4 <= ap_const_lv1_1;
            else 
                ap_phi_mux_UnifiedRetVal_phi_fu_89_p4 <= "X";
            end if;
        else 
            ap_phi_mux_UnifiedRetVal_phi_fu_89_p4 <= "X";
        end if; 
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_CS_fsm_state1, icmp_ln2139_fu_141_p2, tmp_fu_118_p3, ap_phi_mux_UnifiedRetVal_phi_fu_89_p4, ap_return_preg, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1) and ((tmp_fu_118_p3 = ap_const_lv1_1) or (icmp_ln2139_fu_141_p2 = ap_const_lv1_0)))) then 
            ap_return <= ap_phi_mux_UnifiedRetVal_phi_fu_89_p4;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;


    ap_sig_allocacmp_k_2_assign_proc : process(ap_CS_fsm_state1, x_fu_50, ap_loop_init)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_sig_allocacmp_k_2 <= ap_const_lv2_1;
        else 
            ap_sig_allocacmp_k_2 <= x_fu_50;
        end if; 
    end process;

    icmp_ln2139_fu_141_p2 <= "1" when (select_ln678_fu_132_p3 = sext_ln2137_cast_fu_97_p3) else "0";
    icmp_ln678_fu_126_p2 <= "0" when (ap_sig_allocacmp_k_2 = ap_const_lv2_0) else "1";
    k_2_out <= ap_sig_allocacmp_k_2(1 - 1 downto 0);

    k_2_out_ap_vld_assign_proc : process(ap_CS_fsm_state1, icmp_ln2139_fu_141_p2, tmp_fu_118_p3, ap_start_int)
    begin
        if ((((tmp_fu_118_p3 = ap_const_lv1_0) and (icmp_ln2139_fu_141_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1)) or ((tmp_fu_118_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1)))) then 
            k_2_out_ap_vld <= ap_const_logic_1;
        else 
            k_2_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    k_fu_147_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_k_2) + unsigned(ap_const_lv2_3));
    select_ln678_fu_132_p3 <= 
        value_1 when (icmp_ln678_fu_126_p2(0) = '1') else 
        value_r;
    select_ln678_out <= select_ln678_fu_132_p3;

    select_ln678_out_ap_vld_assign_proc : process(ap_CS_fsm_state1, icmp_ln2139_fu_141_p2, tmp_fu_118_p3, ap_start_int)
    begin
        if (((tmp_fu_118_p3 = ap_const_lv1_0) and (icmp_ln2139_fu_141_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1))) then 
            select_ln678_out_ap_vld <= ap_const_logic_1;
        else 
            select_ln678_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    sext_ln2137_cast_fu_97_p3 <= 
        ap_const_lv32_FFFFFFFF when (sext_ln2137(0) = '1') else 
        ap_const_lv32_0;
    tmp_fu_118_p3 <= ap_sig_allocacmp_k_2(1 downto 1);
end behav;
