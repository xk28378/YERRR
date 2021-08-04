vlib work
vlib riviera

vlib riviera/xbip_utils_v3_0_10
vlib riviera/c_reg_fd_v12_0_6
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_dsp48_addsub_v3_0_6
vlib riviera/xbip_addsub_v3_0_6
vlib riviera/c_addsub_v12_0_14
vlib riviera/xil_defaultlib
vlib riviera/xbip_bram18k_v3_0_6
vlib riviera/mult_gen_v12_0_16

vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap c_reg_fd_v12_0_6 riviera/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 riviera/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 riviera/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 riviera/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_14 riviera/c_addsub_v12_0_14
vmap xil_defaultlib riviera/xil_defaultlib
vmap xbip_bram18k_v3_0_6 riviera/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 riviera/mult_gen_v12_0_16

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../HW4.srcs/sources_1/bd/ALU/ipshared/b795/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_6 -93 \
"../../../../HW4.srcs/sources_1/bd/ALU/ipshared/edec/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../HW4.srcs/sources_1/bd/ALU/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../HW4.srcs/sources_1/bd/ALU/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../../HW4.srcs/sources_1/bd/ALU/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6 -93 \
"../../../../HW4.srcs/sources_1/bd/ALU/ipshared/cfdd/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_14 -93 \
"../../../../HW4.srcs/sources_1/bd/ALU/ipshared/ebb8/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/ALU/ip/ALU_c_addsub_0_0/sim/ALU_c_addsub_0_0.vhd" \
"../../../bd/ALU/ip/ALU_c_addsub_1_0/sim/ALU_c_addsub_1_0.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../../HW4.srcs/sources_1/bd/ALU/ipshared/d367/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../../HW4.srcs/sources_1/bd/ALU/ipshared/ce84/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/ALU/ip/ALU_mult_gen_0_0/sim/ALU_mult_gen_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/ALU/ip/ALU_and16_0_0/sim/ALU_and16_0_0.v" \
"../../../bd/ALU/ip/ALU_or16_0_0/sim/ALU_or16_0_0.v" \
"../../../bd/ALU/ip/ALU_xor16_0_0/sim/ALU_xor16_0_0.v" \
"../../../bd/ALU/sim/ALU.v" \

vlog -work xil_defaultlib \
"glbl.v"

