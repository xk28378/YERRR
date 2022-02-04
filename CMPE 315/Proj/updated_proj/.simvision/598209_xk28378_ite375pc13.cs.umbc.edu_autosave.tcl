
# NC-Sim Command File
# TOOL:	ncsim	15.20-s035
#

set tcl_prompt1 {puts -nonewline "ncsim> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed 1
set assert_reporting_mode 0
alias iprof profile
database -open -shm -into waves.shm waves -default
probe -create -database waves :busy :clk :clk_count :clock :cpu_add :cpu_data :cpu_rd_wrn :Gnd :mem_add :mem_data :mem_en :reset :start :Vdd
probe -create -database waves :c1:state_machine_1:busy :c1:state_machine_1:busy_check :c1:state_machine_1:clk :c1:state_machine_1:count :c1:state_machine_1:out1 :c1:state_machine_1:RH :c1:state_machine_1:RM :c1:state_machine_1:rst :c1:state_machine_1:sel :c1:state_machine_1:temp1 :c1:state_machine_1:temp2 :c1:state_machine_1:temp3 :c1:state_machine_1:temp4 :c1:state_machine_1:WH :c1:state_machine_1:WM
probe -create -database waves :c1:hit_miss_1:cpu_tag :c1:hit_miss_1:hit_or_miss :c1:hit_miss_1:hit_tag :c1:hit_miss_1:mid1 :c1:hit_miss_1:tag :c1:hit_miss_1:valid
probe -create -database waves :c1:cache_valid_1:blk_off :c1:cache_valid_1:clk :c1:cache_valid_1:decoder_enable :c1:cache_valid_1:decoder_out :c1:cache_valid_1:mid1 :c1:cache_valid_1:mid2 :c1:cache_valid_1:rd_valid :c1:cache_valid_1:rd_valid1 :c1:cache_valid_1:rd_valid2 :c1:cache_valid_1:rd_valid3 :c1:cache_valid_1:rd_valid4 :c1:cache_valid_1:rd_valid5 :c1:cache_valid_1:rd_valid6 :c1:cache_valid_1:rd_valid7 :c1:cache_valid_1:rd_valid8 :c1:cache_valid_1:rst :c1:cache_valid_1:w_r_en :c1:cache_valid_1:wr_valid :c1:cache_valid_1:write1 :c1:cache_valid_1:write2 :c1:cache_valid_1:write3 :c1:cache_valid_1:write4 :c1:cache_valid_1:write5 :c1:cache_valid_1:write6 :c1:cache_valid_1:write7 :c1:cache_valid_1:write8
probe -create -database waves :c1:cache_tag_1:blk_off :c1:cache_tag_1:clk :c1:cache_tag_1:decoder_enable :c1:cache_tag_1:decoder_out :c1:cache_tag_1:rd_tag :c1:cache_tag_1:rd_tag1 :c1:cache_tag_1:rd_tag2 :c1:cache_tag_1:rd_tag3 :c1:cache_tag_1:rd_tag4 :c1:cache_tag_1:rd_tag5 :c1:cache_tag_1:rd_tag6 :c1:cache_tag_1:rd_tag7 :c1:cache_tag_1:rd_tag8 :c1:cache_tag_1:w_r_en :c1:cache_tag_1:wr_tag :c1:cache_tag_1:write1 :c1:cache_tag_1:write2 :c1:cache_tag_1:write3 :c1:cache_tag_1:write4 :c1:cache_tag_1:write5 :c1:cache_tag_1:write6 :c1:cache_tag_1:write7 :c1:cache_tag_1:write8

simvision -input /afs/umbc.edu/users/x/k/xk28378/home/315/proj/.simvision/598209_xk28378_ite375pc13.cs.umbc.edu_autosave.tcl.svcf
