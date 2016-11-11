# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./alu.sv"
vlog "./Bit_Slice.sv"
vlog "./full_adder.sv"
vlog "./subs.sv"
vlog "./or_4.sv"
vlog "./or_8.sv"
vlog "./or_16.sv"
vlog "./or_32.sv"
vlog "./ZeroFlag.sv"
vlog "./mux5_2_1.sv"
vlog "./mux64_2_1.sv"
vlog "./mux6432_1.sv"
vlog "./mux32_1.sv"
vlog "./mux16_1.sv"
vlog "./mux8_1.sv"
vlog "./mux4_1.sv"
vlog "./mux2_1.sv"
vlog "./DFF_REG.sv"
vlog "./DFF_VAR.sv"
vlog "./D_FF.sv"
vlog "./enDecoder1_2.sv"
vlog "./enDecoder2_4.sv"
vlog "./enDecoder4_16.sv"
vlog "./enDecoder5_32.sv"
vlog "./regfile.sv"
vlog "./instructmem.sv"
vlog "./datamem.sv"
vlog "./math.sv"
vlog "./Control.sv"
vlog "./CPU.sv"
vlog "./calPC.sv"
vlog "./SignExtend.sv"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work CPU_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do CPU_testbench_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
