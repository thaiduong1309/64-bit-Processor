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
add wave -noupdate -childformat {{{/CPU_testbench/dut/r/q[31]} -radix decimal} {{/CPU_testbench/dut/r/q[30]} -radix decimal} {{/CPU_testbench/dut/r/q[29]} -radix decimal} {{/CPU_testbench/dut/r/q[28]} -radix decimal} {{/CPU_testbench/dut/r/q[27]} -radix decimal} {{/CPU_testbench/dut/r/q[26]} -radix decimal} {{/CPU_testbench/dut/r/q[25]} -radix decimal} {{/CPU_testbench/dut/r/q[24]} -radix decimal} {{/CPU_testbench/dut/r/q[23]} -radix decimal} {{/CPU_testbench/dut/r/q[22]} -radix decimal} {{/CPU_testbench/dut/r/q[21]} -radix decimal} {{/CPU_testbench/dut/r/q[20]} -radix decimal} {{/CPU_testbench/dut/r/q[19]} -radix decimal} {{/CPU_testbench/dut/r/q[18]} -radix decimal} {{/CPU_testbench/dut/r/q[17]} -radix decimal} {{/CPU_testbench/dut/r/q[16]} -radix decimal} {{/CPU_testbench/dut/r/q[15]} -radix decimal} {{/CPU_testbench/dut/r/q[14]} -radix decimal} {{/CPU_testbench/dut/r/q[13]} -radix decimal} {{/CPU_testbench/dut/r/q[12]} -radix decimal} {{/CPU_testbench/dut/r/q[11]} -radix decimal} {{/CPU_testbench/dut/r/q[10]} -radix decimal} {{/CPU_testbench/dut/r/q[9]} -radix decimal} {{/CPU_testbench/dut/r/q[8]} -radix decimal} {{/CPU_testbench/dut/r/q[7]} -radix decimal} {{/CPU_testbench/dut/r/q[6]} -radix decimal} {{/CPU_testbench/dut/r/q[5]} -radix decimal} {{/CPU_testbench/dut/r/q[4]} -radix decimal} {{/CPU_testbench/dut/r/q[3]} -radix decimal} {{/CPU_testbench/dut/r/q[2]} -radix decimal} {{/CPU_testbench/dut/r/q[1]} -radix decimal} {{/CPU_testbench/dut/r/q[0]} -radix decimal}} -expand -subitemconfig {{/CPU_testbench/dut/r/q[31]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[30]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[29]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[28]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[27]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[26]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[25]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[24]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[23]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[22]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[21]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[20]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[19]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[18]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[17]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[16]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[15]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[14]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[13]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[12]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[11]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[10]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[9]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[8]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[7]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[6]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[5]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[4]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[3]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[2]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[1]} {-height 15 -radix decimal} {/CPU_testbench/dut/r/q[0]} {-height 15 -radix decimal}} /CPU_testbench/dut/r/q
add wave -noupdate -radix decimal {/CPU_testbench/dut/da/mem[0]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/da/mem[8]}
add wave -noupdate -radix decimal {/CPU_testbench/dut/da/mem[16]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3002453980 ps} 0}
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
WaveRestoreZoom {2998545974 ps} {3009287054 ps}
