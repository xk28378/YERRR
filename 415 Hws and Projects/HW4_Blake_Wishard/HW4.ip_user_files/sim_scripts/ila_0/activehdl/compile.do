vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../HW4.srcs/sources_1/ip/ila_0/hdl/verilog" \
"../../../../HW4.srcs/sources_1/ip/ila_0/sim/ila_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

