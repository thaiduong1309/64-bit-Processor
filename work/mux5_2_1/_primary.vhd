library verilog;
use verilog.vl_types.all;
entity mux5_2_1 is
    port(
        sel             : in     vl_logic;
        in0             : in     vl_logic_vector(4 downto 0);
        in1             : in     vl_logic_vector(4 downto 0);
        \out\           : out    vl_logic_vector(4 downto 0)
    );
end mux5_2_1;
