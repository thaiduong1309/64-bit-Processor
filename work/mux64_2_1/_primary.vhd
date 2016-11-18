library verilog;
use verilog.vl_types.all;
entity mux64_2_1 is
    port(
        sel             : in     vl_logic;
        in0             : in     vl_logic_vector(63 downto 0);
        in1             : in     vl_logic_vector(63 downto 0);
        \out\           : out    vl_logic_vector(63 downto 0)
    );
end mux64_2_1;
