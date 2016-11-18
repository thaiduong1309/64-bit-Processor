library verilog;
use verilog.vl_types.all;
entity CPU_testbench is
    generic(
        CLOCK_PERIOD    : integer := 1000000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLOCK_PERIOD : constant is 1;
end CPU_testbench;
