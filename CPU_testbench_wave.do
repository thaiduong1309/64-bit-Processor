onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_testbench/clk
add wave -noupdate /CPU_testbench/cp/instruction
add wave -noupdate /CPU_testbench/cp/ReadData1
add wave -noupdate /CPU_testbench/cp/ReadData2
add wave -noupdate /CPU_testbench/cp/result
add wave -noupdate /CPU_testbench/cp/PC
add wave -noupdate /CPU_testbench/cp/PC_result
add wave -noupdate /CPU_testbench/cp/Reg2Loc
add wave -noupdate /CPU_testbench/cp/ALUsrc
add wave -noupdate /CPU_testbench/cp/MemtoReg
add wave -noupdate /CPU_testbench/cp/RegWri
add wave -noupdate /CPU_testbench/cp/MemWri
add wave -noupdate /CPU_testbench/cp/BrTaken
add wave -noupdate /CPU_testbench/cp/UncondBr
add wave -noupdate /CPU_testbench/cp/Readmem
add wave -noupdate /CPU_testbench/cp/ALUsrc1
add wave -noupdate /CPU_testbench/cp/ALUOp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {73 ps} 0}
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
WaveRestoreZoom {0 ps} {312 ps}
