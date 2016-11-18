onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_testbench/clk
add wave -noupdate /CPU_testbench/reset
add wave -noupdate -radix decimal /CPU_testbench/dut/exc/result
add wave -noupdate -radix decimal /CPU_testbench/dut/SE/Imm12
add wave -noupdate -radix hexadecimal /CPU_testbench/dut/cal/PC
add wave -noupdate -radix hexadecimal /CPU_testbench/dut/cal/PC_result
add wave -noupdate /CPU_testbench/dut/ins/instruction
add wave -noupdate /CPU_testbench/dut/c1/ALUOp
add wave -noupdate /CPU_testbench/dut/c1/Reg2Loc
add wave -noupdate /CPU_testbench/dut/c1/ALUsrc
add wave -noupdate /CPU_testbench/dut/c1/MemtoReg
add wave -noupdate /CPU_testbench/dut/c1/RegWri
add wave -noupdate /CPU_testbench/dut/c1/MemWri
add wave -noupdate /CPU_testbench/dut/c1/BrTaken
add wave -noupdate /CPU_testbench/dut/c1/UncondBr
add wave -noupdate /CPU_testbench/dut/c1/Readmem
add wave -noupdate /CPU_testbench/dut/c1/ALUsrc1
add wave -noupdate /CPU_testbench/dut/c1/WriteRd
add wave -noupdate -radix binary /CPU_testbench/dut/flag
add wave -noupdate -radix unsigned /CPU_testbench/dut/r/WriteRegister
add wave -noupdate -radix decimal /CPU_testbench/dut/r/WriteData
add wave -noupdate -radix unsigned /CPU_testbench/dut/r/ReadRegister1
add wave -noupdate -radix unsigned /CPU_testbench/dut/r/ReadRegister2
add wave -noupdate -radix decimal /CPU_testbench/dut/r/ReadData1
add wave -noupdate -radix decimal /CPU_testbench/dut/r/ReadData2
add wave -noupdate -radix decimal {/CPU_testbench/dut/r/q[0]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/r/q[1]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/r/q[2]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/r/q[3]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/r/q[4]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/r/q[5]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/r/q[6]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/r/q[7]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/r/q[29]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/r/q[30]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/da/mem[0]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/da/mem[8]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/da/mem[16]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13973717000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {11051077818 ps} {22049943273 ps}
