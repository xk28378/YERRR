
################################################################
# This is a generated script based on design: ALU
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source ALU_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# and16, or16, xor16

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
   set_property BOARD_PART digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name ALU

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set A [ create_bd_port -dir I -from 15 -to 0 -type data A ]
  set AND_OUT [ create_bd_port -dir O -from 15 -to 0 -type data AND_OUT ]
  set AVALID [ create_bd_port -dir I AVALID ]
  set B [ create_bd_port -dir I -from 15 -to 0 -type data B ]
  set BVALID [ create_bd_port -dir I BVALID ]
  set D [ create_bd_port -dir O -from 15 -to 0 -type data D ]
  set OR_OUT [ create_bd_port -dir O -from 15 -to 0 -type data OR_OUT ]
  set P [ create_bd_port -dir O -from 31 -to 0 -type data P ]
  set Q [ create_bd_port -dir O -from 31 -to 0 -type data Q ]
  set QVALID [ create_bd_port -dir O QVALID ]
  set S [ create_bd_port -dir O -from 15 -to 0 -type data S ]
  set XOR_OUT [ create_bd_port -dir O -from 15 -to 0 -type data XOR_OUT ]
  set clk [ create_bd_port -dir I -type clk -freq_hz 50000000 clk ]

  # Create instance: and16_0, and set properties
  set block_name and16
  set block_cell_name and16_0
  if { [catch {set and16_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $and16_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: c_addsub_0, and set properties
  set c_addsub_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_0 ]
  set_property -dict [ list \
   CONFIG.A_Width {16} \
   CONFIG.B_Value {0000000000000000} \
   CONFIG.B_Width {16} \
   CONFIG.CE {false} \
   CONFIG.Latency {1} \
   CONFIG.Out_Width {16} \
 ] $c_addsub_0

  # Create instance: c_addsub_1, and set properties
  set c_addsub_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_1 ]
  set_property -dict [ list \
   CONFIG.A_Width {16} \
   CONFIG.Add_Mode {Subtract} \
   CONFIG.B_Value {0000000000000000} \
   CONFIG.B_Width {16} \
   CONFIG.CE {false} \
   CONFIG.Latency {1} \
   CONFIG.Out_Width {16} \
 ] $c_addsub_1

  # Create instance: div_gen_0, and set properties
  set div_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:div_gen:5.1 div_gen_0 ]
  set_property -dict [ list \
   CONFIG.dividend_and_quotient_width {16} \
   CONFIG.divisor_width {16} \
 ] $div_gen_0

  # Create instance: mult_gen_0, and set properties
  set mult_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_0 ]
  set_property -dict [ list \
   CONFIG.OutputWidthHigh {31} \
   CONFIG.PortAWidth {16} \
   CONFIG.PortBWidth {16} \
 ] $mult_gen_0

  # Create instance: or16_0, and set properties
  set block_name or16
  set block_cell_name or16_0
  if { [catch {set or16_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $or16_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xor16_0, and set properties
  set block_name xor16
  set block_cell_name xor16_0
  if { [catch {set xor16_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $xor16_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net AVALID_1 [get_bd_ports AVALID] [get_bd_pins div_gen_0/s_axis_divisor_tvalid]
  connect_bd_net -net A_1 [get_bd_ports A] [get_bd_pins and16_0/A] [get_bd_pins c_addsub_0/A] [get_bd_pins c_addsub_1/A] [get_bd_pins div_gen_0/s_axis_divisor_tdata] [get_bd_pins mult_gen_0/A] [get_bd_pins or16_0/A] [get_bd_pins xor16_0/A]
  connect_bd_net -net BVALID_1 [get_bd_ports BVALID] [get_bd_pins div_gen_0/s_axis_dividend_tvalid]
  connect_bd_net -net B_1 [get_bd_ports B] [get_bd_pins and16_0/B] [get_bd_pins c_addsub_0/B] [get_bd_pins c_addsub_1/B] [get_bd_pins div_gen_0/s_axis_dividend_tdata] [get_bd_pins mult_gen_0/B] [get_bd_pins or16_0/B] [get_bd_pins xor16_0/B]
  connect_bd_net -net and16_0_Y [get_bd_ports AND_OUT] [get_bd_pins and16_0/Y]
  connect_bd_net -net c_addsub_0_S [get_bd_ports S] [get_bd_pins c_addsub_0/S]
  connect_bd_net -net c_addsub_1_S [get_bd_ports D] [get_bd_pins c_addsub_1/S]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins c_addsub_0/CLK] [get_bd_pins c_addsub_1/CLK] [get_bd_pins div_gen_0/aclk] [get_bd_pins mult_gen_0/CLK]
  connect_bd_net -net div_gen_0_m_axis_dout_tdata [get_bd_ports Q] [get_bd_pins div_gen_0/m_axis_dout_tdata]
  connect_bd_net -net div_gen_0_m_axis_dout_tvalid [get_bd_ports QVALID] [get_bd_pins div_gen_0/m_axis_dout_tvalid]
  connect_bd_net -net mult_gen_0_P [get_bd_ports P] [get_bd_pins mult_gen_0/P]
  connect_bd_net -net or16_0_Y [get_bd_ports OR_OUT] [get_bd_pins or16_0/Y]
  connect_bd_net -net xor16_0_Y [get_bd_ports XOR_OUT] [get_bd_pins xor16_0/Y]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


