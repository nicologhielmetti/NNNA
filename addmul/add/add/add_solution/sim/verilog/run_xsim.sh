
/opt/Xilinx/Vivado/2021.2/bin/xelab xil_defaultlib.apatb_add_top_top glbl -Oenable_linking_all_libraries  -prj add_top.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver -L xpm  -L floating_point_v7_0_19 -L floating_point_v7_1_13 --lib "ieee_proposed=./ieee_proposed" -s add_top -debug wave
/opt/Xilinx/Vivado/2021.2/bin/xsim --noieeewarnings add_top -tclbatch add_top.tcl -view add_top_dataflow_ana.wcfg -protoinst add_top.protoinst
