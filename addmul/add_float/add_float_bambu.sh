.././bambu.AppImage add_float.cpp --no-iob --clock-period=50 -O2 --std=c++14 --compiler=I386_CLANG12 -v4 -I../ac_types/include -D__BAMBU__ -D__VIVADO__ -DAC_TYPES_INIT -D__SYNTHESIS__ --top-fname=add_float_top --generate-interface=INFER --generate-tb=test.xml --simulator=VERILATOR --simulate --device-name=xc7z020-1clg484-VVD --print-dot