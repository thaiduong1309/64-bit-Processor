library verilog;
use verilog.vl_types.all;
entity SignExtend_testbench is
    generic(
        delay           : integer := 100000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of delay : constant is 1;
end SignExtend_testbench;
