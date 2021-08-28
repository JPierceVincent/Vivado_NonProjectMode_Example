# filename: build.tcl

# Assign part to in-memory project (will also create the in-memory project)
# Used when generating ip and executing synth, impl.
set_part "xcku060-ffva1517-2-i"

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

# Write out bitfile
write_debug_probes -force led_test_nonProject.ltx
write_bitstream -force led_test_nonProject.bit
