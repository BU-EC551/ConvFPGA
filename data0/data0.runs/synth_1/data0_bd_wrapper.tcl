# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/karanraj/Documents/data0/data0.cache/wt [current_project]
set_property parent.project_path C:/Users/karanraj/Documents/data0/data0.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:zedboard:part0:1.0 [current_project]
set_property ip_repo_paths c:/Users/karanraj/Documents/ip_repo/myip0_1.0 [current_project]
set_property ip_output_repo c:/Users/karanraj/Documents/data0/data0.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/hdl/data0_bd_wrapper.v
add_files C:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/data0_bd.bd
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_processing_system7_0_0/data0_bd_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_proc_sys_reset_0_0/data0_bd_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_proc_sys_reset_0_0/data0_bd_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_proc_sys_reset_0_0/data0_bd_proc_sys_reset_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_dma_0_0/data0_bd_axi_dma_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_dma_0_0/data0_bd_axi_dma_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_dma_0_0/data0_bd_axi_dma_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_10/bd_22a2_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_19/bd_22a2_s01a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_25/bd_22a2_s02a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_29/bd_22a2_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_30/bd_22a2_m00arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_31/bd_22a2_m00rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_32/bd_22a2_m00awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_33/bd_22a2_m00wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_34/bd_22a2_m00bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_26/bd_22a2_sawn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_27/bd_22a2_swn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_28/bd_22a2_sbn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_20/bd_22a2_sarn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_21/bd_22a2_srn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_11/bd_22a2_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_12/bd_22a2_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_13/bd_22a2_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_14/bd_22a2_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_15/bd_22a2_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_2/bd_22a2_arsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_3/bd_22a2_rsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_4/bd_22a2_awsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_5/bd_22a2_wsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_6/bd_22a2_bsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_1/bd_22a2_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/bd_0/ip/ip_1/bd_22a2_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axi_smc_1/ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axis_data_fifo_0_0/data0_bd_axis_data_fifo_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_axis_data_fifo_0_0/data0_bd_axis_data_fifo_0_0/data0_bd_axis_data_fifo_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/ip/data0_bd_auto_pc_0/data0_bd_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/karanraj/Documents/data0/data0.srcs/sources_1/bd/data0_bd/data0_bd_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top data0_bd_wrapper -part xc7z020clg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef data0_bd_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file data0_bd_wrapper_utilization_synth.rpt -pb data0_bd_wrapper_utilization_synth.pb"
