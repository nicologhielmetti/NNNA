-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mul_fixed_top is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    a : IN STD_LOGIC_VECTOR (319 downto 0);
    b : IN STD_LOGIC_VECTOR (319 downto 0);
    res : OUT STD_LOGIC_VECTOR (319 downto 0);
    res_ap_vld : OUT STD_LOGIC );
end;


architecture behav of mul_fixed_top is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "mul_fixed_top_mul_fixed_top,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=50.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=35.715667,HLS_SYN_LAT=37,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=4463,HLS_SYN_LUT=14517,HLS_VERSION=2022_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (7 downto 0) := "00100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv64_4 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000100";
    constant ap_const_lv64_5 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000101";
    constant ap_const_lv64_6 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000110";
    constant ap_const_lv64_7 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000111";
    constant ap_const_lv64_8 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000001000";
    constant ap_const_lv64_9 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000001001";
    constant ap_const_lv64_A : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000001010";
    constant ap_const_lv64_B : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000001011";
    constant ap_const_lv64_C : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000001100";
    constant ap_const_lv64_D : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000001101";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_1A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011010";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal trunc_ln6_fu_180_p1 : STD_LOGIC_VECTOR (280 downto 0);
    signal trunc_ln6_reg_229 : STD_LOGIC_VECTOR (280 downto 0);
    signal trunc_ln6_1_fu_185_p1 : STD_LOGIC_VECTOR (280 downto 0);
    signal trunc_ln6_1_reg_234 : STD_LOGIC_VECTOR (280 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ref_tmp1_i_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal hw_reg_249 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal lshr_ln_reg_254 : STD_LOGIC_VECTOR (5 downto 0);
    signal ref_tmp1_i_q1 : STD_LOGIC_VECTOR (31 downto 0);
    signal hw_1_reg_269 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal hw_2_reg_274 : STD_LOGIC_VECTOR (31 downto 0);
    signal hw_3_reg_289 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal hw_4_reg_294 : STD_LOGIC_VECTOR (31 downto 0);
    signal hw_5_reg_309 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal hw_6_reg_314 : STD_LOGIC_VECTOR (31 downto 0);
    signal ref_tmp1_i_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal ref_tmp1_i_ce0 : STD_LOGIC;
    signal ref_tmp1_i_we0 : STD_LOGIC;
    signal ref_tmp1_i_address1 : STD_LOGIC_VECTOR (4 downto 0);
    signal ref_tmp1_i_ce1 : STD_LOGIC;
    signal ref_tmp1_i_we1 : STD_LOGIC;
    signal grp_operator_mul_281_127_true_0_0_fu_172_ap_start : STD_LOGIC;
    signal grp_operator_mul_281_127_true_0_0_fu_172_ap_done : STD_LOGIC;
    signal grp_operator_mul_281_127_true_0_0_fu_172_ap_idle : STD_LOGIC;
    signal grp_operator_mul_281_127_true_0_0_fu_172_ap_ready : STD_LOGIC;
    signal grp_operator_mul_281_127_true_0_0_fu_172_agg_result_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_operator_mul_281_127_true_0_0_fu_172_agg_result_ce0 : STD_LOGIC;
    signal grp_operator_mul_281_127_true_0_0_fu_172_agg_result_we0 : STD_LOGIC;
    signal grp_operator_mul_281_127_true_0_0_fu_172_agg_result_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_operator_mul_281_127_true_0_0_fu_172_agg_result_address1 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_operator_mul_281_127_true_0_0_fu_172_agg_result_ce1 : STD_LOGIC;
    signal grp_operator_mul_281_127_true_0_0_fu_172_agg_result_we1 : STD_LOGIC;
    signal grp_operator_mul_281_127_true_0_0_fu_172_agg_result_d1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_operator_mul_281_127_true_0_0_fu_172_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal trunc_ln1911_fu_200_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal tmp_fu_204_p11 : STD_LOGIC_VECTOR (280 downto 0);
    signal sext_ln6_fu_220_p1 : STD_LOGIC_VECTOR (287 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component mul_fixed_top_operator_mul_281_127_true_0_0 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        agg_result_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
        agg_result_ce0 : OUT STD_LOGIC;
        agg_result_we0 : OUT STD_LOGIC;
        agg_result_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        agg_result_address1 : OUT STD_LOGIC_VECTOR (4 downto 0);
        agg_result_ce1 : OUT STD_LOGIC;
        agg_result_we1 : OUT STD_LOGIC;
        agg_result_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        p_read : IN STD_LOGIC_VECTOR (280 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (280 downto 0) );
    end component;


    component mul_fixed_top_ref_tmp1_i_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        address1 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce1 : IN STD_LOGIC;
        we1 : IN STD_LOGIC;
        d1 : IN STD_LOGIC_VECTOR (31 downto 0);
        q1 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    ref_tmp1_i_U : component mul_fixed_top_ref_tmp1_i_RAM_AUTO_1R1W
    generic map (
        DataWidth => 32,
        AddressRange => 18,
        AddressWidth => 5)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => ref_tmp1_i_address0,
        ce0 => ref_tmp1_i_ce0,
        we0 => ref_tmp1_i_we0,
        d0 => grp_operator_mul_281_127_true_0_0_fu_172_agg_result_d0,
        q0 => ref_tmp1_i_q0,
        address1 => ref_tmp1_i_address1,
        ce1 => ref_tmp1_i_ce1,
        we1 => ref_tmp1_i_we1,
        d1 => grp_operator_mul_281_127_true_0_0_fu_172_agg_result_d1,
        q1 => ref_tmp1_i_q1);

    grp_operator_mul_281_127_true_0_0_fu_172 : component mul_fixed_top_operator_mul_281_127_true_0_0
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_operator_mul_281_127_true_0_0_fu_172_ap_start,
        ap_done => grp_operator_mul_281_127_true_0_0_fu_172_ap_done,
        ap_idle => grp_operator_mul_281_127_true_0_0_fu_172_ap_idle,
        ap_ready => grp_operator_mul_281_127_true_0_0_fu_172_ap_ready,
        agg_result_address0 => grp_operator_mul_281_127_true_0_0_fu_172_agg_result_address0,
        agg_result_ce0 => grp_operator_mul_281_127_true_0_0_fu_172_agg_result_ce0,
        agg_result_we0 => grp_operator_mul_281_127_true_0_0_fu_172_agg_result_we0,
        agg_result_d0 => grp_operator_mul_281_127_true_0_0_fu_172_agg_result_d0,
        agg_result_address1 => grp_operator_mul_281_127_true_0_0_fu_172_agg_result_address1,
        agg_result_ce1 => grp_operator_mul_281_127_true_0_0_fu_172_agg_result_ce1,
        agg_result_we1 => grp_operator_mul_281_127_true_0_0_fu_172_agg_result_we1,
        agg_result_d1 => grp_operator_mul_281_127_true_0_0_fu_172_agg_result_d1,
        p_read => trunc_ln6_reg_229,
        p_read1 => trunc_ln6_1_reg_234);





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


    grp_operator_mul_281_127_true_0_0_fu_172_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_operator_mul_281_127_true_0_0_fu_172_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    grp_operator_mul_281_127_true_0_0_fu_172_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_operator_mul_281_127_true_0_0_fu_172_ap_ready = ap_const_logic_1)) then 
                    grp_operator_mul_281_127_true_0_0_fu_172_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                hw_1_reg_269 <= ref_tmp1_i_q1;
                hw_2_reg_274 <= ref_tmp1_i_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                hw_3_reg_289 <= ref_tmp1_i_q1;
                hw_4_reg_294 <= ref_tmp1_i_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
                hw_5_reg_309 <= ref_tmp1_i_q1;
                hw_6_reg_314 <= ref_tmp1_i_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                hw_reg_249 <= ref_tmp1_i_q0;
                lshr_ln_reg_254 <= ref_tmp1_i_q1(31 downto 26);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                trunc_ln6_1_reg_234 <= trunc_ln6_1_fu_185_p1;
                trunc_ln6_reg_229 <= trunc_ln6_fu_180_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_operator_mul_281_127_true_0_0_fu_172_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (grp_operator_mul_281_127_true_0_0_fu_172_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_operator_mul_281_127_true_0_0_fu_172_ap_done)
    begin
        if ((grp_operator_mul_281_127_true_0_0_fu_172_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_operator_mul_281_127_true_0_0_fu_172_ap_start <= grp_operator_mul_281_127_true_0_0_fu_172_ap_start_reg;

    ref_tmp1_i_address0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, grp_operator_mul_281_127_true_0_0_fu_172_agg_result_address0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ref_tmp1_i_address0 <= ap_const_lv64_D(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ref_tmp1_i_address0 <= ap_const_lv64_B(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ref_tmp1_i_address0 <= ap_const_lv64_9(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ref_tmp1_i_address0 <= ap_const_lv64_7(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ref_tmp1_i_address0 <= ap_const_lv64_5(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ref_tmp1_i_address0 <= grp_operator_mul_281_127_true_0_0_fu_172_agg_result_address0;
        else 
            ref_tmp1_i_address0 <= "XXXXX";
        end if; 
    end process;


    ref_tmp1_i_address1_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, grp_operator_mul_281_127_true_0_0_fu_172_agg_result_address1, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ref_tmp1_i_address1 <= ap_const_lv64_C(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ref_tmp1_i_address1 <= ap_const_lv64_A(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ref_tmp1_i_address1 <= ap_const_lv64_8(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ref_tmp1_i_address1 <= ap_const_lv64_6(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ref_tmp1_i_address1 <= ap_const_lv64_4(5 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ref_tmp1_i_address1 <= grp_operator_mul_281_127_true_0_0_fu_172_agg_result_address1;
        else 
            ref_tmp1_i_address1 <= "XXXXX";
        end if; 
    end process;


    ref_tmp1_i_ce0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, grp_operator_mul_281_127_true_0_0_fu_172_agg_result_ce0, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ref_tmp1_i_ce0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ref_tmp1_i_ce0 <= grp_operator_mul_281_127_true_0_0_fu_172_agg_result_ce0;
        else 
            ref_tmp1_i_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    ref_tmp1_i_ce1_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, grp_operator_mul_281_127_true_0_0_fu_172_agg_result_ce1, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ref_tmp1_i_ce1 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ref_tmp1_i_ce1 <= grp_operator_mul_281_127_true_0_0_fu_172_agg_result_ce1;
        else 
            ref_tmp1_i_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    ref_tmp1_i_we0_assign_proc : process(grp_operator_mul_281_127_true_0_0_fu_172_agg_result_we0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ref_tmp1_i_we0 <= grp_operator_mul_281_127_true_0_0_fu_172_agg_result_we0;
        else 
            ref_tmp1_i_we0 <= ap_const_logic_0;
        end if; 
    end process;


    ref_tmp1_i_we1_assign_proc : process(grp_operator_mul_281_127_true_0_0_fu_172_agg_result_we1, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ref_tmp1_i_we1 <= grp_operator_mul_281_127_true_0_0_fu_172_agg_result_we1;
        else 
            ref_tmp1_i_we1 <= ap_const_logic_0;
        end if; 
    end process;

    res <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln6_fu_220_p1),320));

    res_ap_vld_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            res_ap_vld <= ap_const_logic_1;
        else 
            res_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

        sext_ln6_fu_220_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_fu_204_p11),288));

    tmp_fu_204_p11 <= (((((((((trunc_ln1911_fu_200_p1 & ref_tmp1_i_q1) & hw_6_reg_314) & hw_5_reg_309) & hw_4_reg_294) & hw_3_reg_289) & hw_2_reg_274) & hw_1_reg_269) & hw_reg_249) & lshr_ln_reg_254);
    trunc_ln1911_fu_200_p1 <= ref_tmp1_i_q0(19 - 1 downto 0);
    trunc_ln6_1_fu_185_p1 <= b(281 - 1 downto 0);
    trunc_ln6_fu_180_p1 <= a(281 - 1 downto 0);
end behav;