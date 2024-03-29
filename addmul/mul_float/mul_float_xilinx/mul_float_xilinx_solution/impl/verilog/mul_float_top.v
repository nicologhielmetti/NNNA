// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="mul_float_top_mul_float_top,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=50.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=26.789000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=876,HLS_VERSION=2022_2}" *)

module mul_float_top (
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a,
        b,
        res,
        res_ap_vld
);


input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [127:0] a;
input  [127:0] b;
output  [127:0] res;
output   res_ap_vld;

reg res_ap_vld;

wire  signed [24:0] trunc_ln609_fu_135_p1;
wire  signed [24:0] trunc_ln609_1_fu_139_p1;
wire   [7:0] trunc_ln609_2_fu_157_p4;
wire   [7:0] trunc_ln609_3_fu_167_p4;
wire   [49:0] mul_ln654_fu_151_p2;
wire   [17:0] trunc_ln678_1_fu_189_p4;
wire   [31:0] value_3_fu_185_p1;
wire  signed [31:0] sext_ln678_fu_199_p1;
wire   [31:0] or_ln1034_fu_203_p2;
wire  signed [8:0] sext_ln1346_1_fu_181_p1;
wire  signed [8:0] sext_ln1346_fu_177_p1;
wire   [0:0] retval_fu_209_p2;
wire   [8:0] add_ln355_fu_215_p2;
wire  signed [24:0] hw_fu_229_p4;
wire   [8:0] select_ln355_fu_221_p3;
wire  signed [9:0] sext_ln1309_fu_249_p1;
wire   [0:0] retval_1_fu_243_p2;
wire   [9:0] value_fu_253_p2;
wire   [9:0] select_ln609_fu_259_p3;
wire   [30:0] shl_ln_fu_267_p3;
wire   [30:0] add_ln609_fu_275_p2;
wire   [9:0] value_2_fu_289_p2;
wire   [31:0] shl_ln609_1_fu_307_p3;
wire   [31:0] add_ln609_1_fu_315_p2;
wire   [2:0] tmp_3_fu_329_p4;
wire   [0:0] tmp_2_fu_321_p3;
wire   [0:0] retval_2_fu_339_p2;
wire   [9:0] sub_ln1845_fu_351_p2;
wire   [3:0] tmp_5_fu_369_p4;
wire   [0:0] icmp_ln1795_fu_379_p2;
wire   [0:0] tmp_4_fu_361_p3;
wire   [4:0] s31_fu_357_p1;
wire   [0:0] ishift_fu_385_p2;
wire   [4:0] s31_1_fu_295_p1;
wire   [3:0] tmp_7_fu_419_p4;
wire   [0:0] icmp_ln1815_fu_429_p2;
wire   [0:0] tmp_6_fu_411_p3;
wire   [0:0] ext_fu_441_p3;
wire   [7:0] trunc_ln609_5_fu_471_p4;
wire   [24:0] s31cast_fu_487_p1;
wire   [5:0] zext_ln1814_1_fu_407_p1;
wire   [5:0] sub_i_i_i_i_i_fu_505_p2;
wire  signed [31:0] sext_ln609_fu_239_p1;
wire   [31:0] zext_ln1814_fu_403_p1;
wire   [31:0] lshr_ln1820_fu_515_p2;
wire   [31:0] select_ln1816_fu_449_p3;
wire   [31:0] zext_ln1820_fu_511_p1;
wire   [31:0] shl_ln1820_fu_525_p2;
wire   [24:0] trunc_ln1820_1_fu_531_p1;
wire   [24:0] trunc_ln1820_fu_521_p1;
wire   [0:0] ishift_1_fu_435_p2;
wire   [24:0] select_ln1816_1_fu_457_p3;
wire   [0:0] tmp_1_fu_299_p3;
wire   [0:0] or_ln1817_fu_549_p2;
wire   [0:0] icmp_ln1817_fu_465_p2;
wire   [0:0] xor_ln1817_fu_555_p2;
wire   [0:0] and_ln1817_fu_561_p2;
wire   [24:0] or_ln1820_fu_535_p2;
wire   [24:0] select_ln1828_fu_541_p3;
wire   [0:0] xor_ln1796_fu_397_p2;
wire   [0:0] and_ln1796_fu_575_p2;
wire   [0:0] icmp_ln1796_fu_391_p2;
wire   [0:0] and_ln1796_1_fu_581_p2;
wire   [24:0] shl_ln1799_fu_491_p2;
wire   [24:0] select_ln1817_fu_567_p3;
wire   [0:0] xor_ln1796_1_fu_595_p2;
wire   [0:0] or_ln1796_fu_601_p2;
wire   [0:0] and_ln1796_2_fu_607_p2;
wire   [24:0] select_ln1807_fu_497_p3;
wire   [24:0] select_ln1796_fu_587_p3;
wire   [0:0] tmp_fu_281_p3;
wire   [0:0] or_ln543_fu_345_p2;
wire   [0:0] xor_ln1123_fu_621_p2;
wire   [0:0] and_ln543_fu_627_p2;
wire   [24:0] select_ln609_1_fu_613_p3;
wire   [0:0] or_ln543_1_fu_641_p2;
wire   [24:0] select_ln543_fu_633_p3;
wire   [24:0] select_ln543_1_fu_647_p3;
wire   [24:0] select_ln543_2_fu_655_p3;
wire   [0:0] tmp_9_fu_667_p3;
wire   [7:0] xor_ln609_fu_481_p2;
wire   [7:0] select_ln1123_fu_675_p3;
wire   [7:0] select_ln543_3_fu_683_p3;
wire  signed [31:0] sext_ln1123_fu_663_p1;
wire   [71:0] tmp_i_fu_691_p4;
wire  signed [95:0] sext_ln6_fu_701_p1;
wire    ap_ce_reg;

mul_float_top_mul_25s_25s_50_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 25 ),
    .din1_WIDTH( 25 ),
    .dout_WIDTH( 50 ))
mul_25s_25s_50_1_1_U1(
    .din0(trunc_ln609_fu_135_p1),
    .din1(trunc_ln609_1_fu_139_p1),
    .dout(mul_ln654_fu_151_p2)
);

always @ (*) begin
    if ((ap_start == 1'b1)) begin
        res_ap_vld = 1'b1;
    end else begin
        res_ap_vld = 1'b0;
    end
end

assign add_ln355_fu_215_p2 = ($signed(sext_ln1346_1_fu_181_p1) + $signed(sext_ln1346_fu_177_p1));

assign add_ln609_1_fu_315_p2 = ($signed(shl_ln609_1_fu_307_p3) + $signed(32'd3758096384));

assign add_ln609_fu_275_p2 = (shl_ln_fu_267_p3 + 31'd268435456);

assign and_ln1796_1_fu_581_p2 = (icmp_ln1796_fu_391_p2 & and_ln1796_fu_575_p2);

assign and_ln1796_2_fu_607_p2 = (tmp_1_fu_299_p3 & or_ln1796_fu_601_p2);

assign and_ln1796_fu_575_p2 = (xor_ln1796_fu_397_p2 & tmp_1_fu_299_p3);

assign and_ln1817_fu_561_p2 = (xor_ln1817_fu_555_p2 & icmp_ln1817_fu_465_p2);

assign and_ln543_fu_627_p2 = (xor_ln1123_fu_621_p2 & or_ln543_fu_345_p2);

assign ap_done = ap_start;

assign ap_idle = 1'b1;

assign ap_ready = ap_start;

assign ext_fu_441_p3 = mul_ln654_fu_151_p2[32'd49];

assign hw_fu_229_p4 = {{mul_ln654_fu_151_p2[49:25]}};

assign icmp_ln1795_fu_379_p2 = ((tmp_5_fu_369_p4 != 4'd0) ? 1'b1 : 1'b0);

assign icmp_ln1796_fu_391_p2 = ((s31_fu_357_p1 != 5'd0) ? 1'b1 : 1'b0);

assign icmp_ln1815_fu_429_p2 = ((tmp_7_fu_419_p4 != 4'd0) ? 1'b1 : 1'b0);

assign icmp_ln1817_fu_465_p2 = ((s31_1_fu_295_p1 != 5'd0) ? 1'b1 : 1'b0);

assign ishift_1_fu_435_p2 = (tmp_6_fu_411_p3 | icmp_ln1815_fu_429_p2);

assign ishift_fu_385_p2 = (tmp_4_fu_361_p3 | icmp_ln1795_fu_379_p2);

assign lshr_ln1820_fu_515_p2 = sext_ln609_fu_239_p1 >> zext_ln1814_fu_403_p1;

assign or_ln1034_fu_203_p2 = (value_3_fu_185_p1 | sext_ln678_fu_199_p1);

assign or_ln1796_fu_601_p2 = (xor_ln1796_1_fu_595_p2 | ishift_fu_385_p2);

assign or_ln1817_fu_549_p2 = (tmp_1_fu_299_p3 | ishift_1_fu_435_p2);

assign or_ln1820_fu_535_p2 = (trunc_ln1820_fu_521_p1 | trunc_ln1820_1_fu_531_p1);

assign or_ln543_1_fu_641_p2 = (tmp_fu_281_p3 | and_ln543_fu_627_p2);

assign or_ln543_fu_345_p2 = (tmp_2_fu_321_p3 | retval_2_fu_339_p2);

assign res = $unsigned(sext_ln6_fu_701_p1);

assign retval_1_fu_243_p2 = ((hw_fu_229_p4 == 25'd0) ? 1'b1 : 1'b0);

assign retval_2_fu_339_p2 = ((tmp_3_fu_329_p4 == 3'd0) ? 1'b1 : 1'b0);

assign retval_fu_209_p2 = ((or_ln1034_fu_203_p2 == 32'd0) ? 1'b1 : 1'b0);

assign s31_1_fu_295_p1 = value_2_fu_289_p2[4:0];

assign s31_fu_357_p1 = sub_ln1845_fu_351_p2[4:0];

assign s31cast_fu_487_p1 = s31_fu_357_p1;

assign select_ln1123_fu_675_p3 = ((tmp_9_fu_667_p3[0:0] == 1'b1) ? 8'd128 : 8'd127);

assign select_ln1796_fu_587_p3 = ((and_ln1796_1_fu_581_p2[0:0] == 1'b1) ? shl_ln1799_fu_491_p2 : select_ln1817_fu_567_p3);

assign select_ln1807_fu_497_p3 = ((ishift_fu_385_p2[0:0] == 1'b1) ? 25'd0 : hw_fu_229_p4);

assign select_ln1816_1_fu_457_p3 = ((ext_fu_441_p3[0:0] == 1'b1) ? 25'd33554431 : 25'd0);

assign select_ln1816_fu_449_p3 = ((ext_fu_441_p3[0:0] == 1'b1) ? 32'd4294967295 : 32'd0);

assign select_ln1817_fu_567_p3 = ((and_ln1817_fu_561_p2[0:0] == 1'b1) ? or_ln1820_fu_535_p2 : select_ln1828_fu_541_p3);

assign select_ln1828_fu_541_p3 = ((ishift_1_fu_435_p2[0:0] == 1'b1) ? select_ln1816_1_fu_457_p3 : hw_fu_229_p4);

assign select_ln355_fu_221_p3 = ((retval_fu_209_p2[0:0] == 1'b1) ? 9'd0 : add_ln355_fu_215_p2);

assign select_ln543_1_fu_647_p3 = ((ext_fu_441_p3[0:0] == 1'b1) ? 25'd16777216 : 25'd16777215);

assign select_ln543_2_fu_655_p3 = ((or_ln543_1_fu_641_p2[0:0] == 1'b1) ? select_ln543_fu_633_p3 : select_ln543_1_fu_647_p3);

assign select_ln543_3_fu_683_p3 = ((and_ln543_fu_627_p2[0:0] == 1'b1) ? xor_ln609_fu_481_p2 : select_ln1123_fu_675_p3);

assign select_ln543_fu_633_p3 = ((and_ln543_fu_627_p2[0:0] == 1'b1) ? hw_fu_229_p4 : select_ln609_1_fu_613_p3);

assign select_ln609_1_fu_613_p3 = ((and_ln1796_2_fu_607_p2[0:0] == 1'b1) ? select_ln1807_fu_497_p3 : select_ln1796_fu_587_p3);

assign select_ln609_fu_259_p3 = ((retval_1_fu_243_p2[0:0] == 1'b1) ? 10'd0 : value_fu_253_p2);

assign sext_ln1123_fu_663_p1 = $signed(select_ln543_2_fu_655_p3);

assign sext_ln1309_fu_249_p1 = $signed(select_ln355_fu_221_p3);

assign sext_ln1346_1_fu_181_p1 = $signed(trunc_ln609_3_fu_167_p4);

assign sext_ln1346_fu_177_p1 = $signed(trunc_ln609_2_fu_157_p4);

assign sext_ln609_fu_239_p1 = hw_fu_229_p4;

assign sext_ln678_fu_199_p1 = $signed(trunc_ln678_1_fu_189_p4);

assign sext_ln6_fu_701_p1 = $signed(tmp_i_fu_691_p4);

assign shl_ln1799_fu_491_p2 = hw_fu_229_p4 << s31cast_fu_487_p1;

assign shl_ln1820_fu_525_p2 = select_ln1816_fu_449_p3 << zext_ln1820_fu_511_p1;

assign shl_ln609_1_fu_307_p3 = {{add_ln609_fu_275_p2}, {1'd0}};

assign shl_ln_fu_267_p3 = {{select_ln609_fu_259_p3}, {21'd0}};

assign sub_i_i_i_i_i_fu_505_p2 = ($signed(6'd32) - $signed(zext_ln1814_1_fu_407_p1));

assign sub_ln1845_fu_351_p2 = (10'd0 - value_2_fu_289_p2);

assign tmp_1_fu_299_p3 = value_2_fu_289_p2[32'd9];

assign tmp_2_fu_321_p3 = add_ln609_1_fu_315_p2[32'd31];

assign tmp_3_fu_329_p4 = {{add_ln609_1_fu_315_p2[31:29]}};

assign tmp_4_fu_361_p3 = sub_ln1845_fu_351_p2[32'd5];

assign tmp_5_fu_369_p4 = {{sub_ln1845_fu_351_p2[9:6]}};

assign tmp_6_fu_411_p3 = value_2_fu_289_p2[32'd5];

assign tmp_7_fu_419_p4 = {{value_2_fu_289_p2[9:6]}};

assign tmp_9_fu_667_p3 = add_ln609_fu_275_p2[32'd30];

assign tmp_fu_281_p3 = add_ln609_fu_275_p2[32'd30];

assign tmp_i_fu_691_p4 = {{{select_ln543_3_fu_683_p3}, {32'd0}}, {sext_ln1123_fu_663_p1}};

assign trunc_ln1820_1_fu_531_p1 = shl_ln1820_fu_525_p2[24:0];

assign trunc_ln1820_fu_521_p1 = lshr_ln1820_fu_515_p2[24:0];

assign trunc_ln609_1_fu_139_p1 = b[24:0];

assign trunc_ln609_2_fu_157_p4 = {{a[71:64]}};

assign trunc_ln609_3_fu_167_p4 = {{b[71:64]}};

assign trunc_ln609_5_fu_471_p4 = {{add_ln609_fu_275_p2[28:21]}};

assign trunc_ln609_fu_135_p1 = a[24:0];

assign trunc_ln678_1_fu_189_p4 = {{mul_ln654_fu_151_p2[49:32]}};

assign value_2_fu_289_p2 = ($signed(10'd896) - $signed(select_ln609_fu_259_p3));

assign value_3_fu_185_p1 = mul_ln654_fu_151_p2[31:0];

assign value_fu_253_p2 = ($signed(sext_ln1309_fu_249_p1) + $signed(10'd2));

assign xor_ln1123_fu_621_p2 = (tmp_fu_281_p3 ^ 1'd1);

assign xor_ln1796_1_fu_595_p2 = (icmp_ln1796_fu_391_p2 ^ 1'd1);

assign xor_ln1796_fu_397_p2 = (ishift_fu_385_p2 ^ 1'd1);

assign xor_ln1817_fu_555_p2 = (or_ln1817_fu_549_p2 ^ 1'd1);

assign xor_ln609_fu_481_p2 = (trunc_ln609_5_fu_471_p4 ^ 8'd128);

assign zext_ln1814_1_fu_407_p1 = s31_1_fu_295_p1;

assign zext_ln1814_fu_403_p1 = s31_1_fu_295_p1;

assign zext_ln1820_fu_511_p1 = sub_i_i_i_i_i_fu_505_p2;

endmodule //mul_float_top
