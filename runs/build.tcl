# filename: build.tcl

set BUILD_DATE [ clock format [ clock seconds ] -format %m%d%Y ]
set BUILD_TIME [ clock format [ clock seconds ] -format %H%M%S ]
#######################################################################################
# User Settings 
#######################################################################################

# global settings
set PROJ_NM "led_test_nonProject"
set PROJ_DIR "./$PROJ_NM"
set PART_NM "xczu9eg-ffvb1156-2-e"


#######################################################################################
# Build Design
###############################################################
# Assign part to in-memory project (will also create the in-memory project)
# Used when generating ip and executing synth, impl.
set_part $PART_NM

# read all design files
read_vhdl ../rtl/top_level.vhd
# read constraints
read_xdc ../rtl/const.xdc
# generate ip
#generate_target all [get_ips]
# Synthesize Design
synth_design -top turnOn_Leds -part xczu9eg-ffvb1156-2-e

# Opt Design 
opt_design

# Place Design
place_design 

# Route Design
route_design

#Put WNS as an indicator for timing in the filename
set WNS [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
puts "Post Route WNS = $WNS"

# Write out bitfile

write_debug_probes -force $PROJ_DIR/${PROJ_NM}_${BUILD_DATE}_${BUILD_TIME}_${WNS}ns.ltx
write_bitstream -force $PROJ_DIR/${PROJ_NM}_${BUILD_DATE}_${BUILD_TIME}_${WNS}ns.bit \
 -bin_file

#write_debug_probes -force led_test_nonProject.ltx
#write_bitstream -force led_test_nonProject.bit
