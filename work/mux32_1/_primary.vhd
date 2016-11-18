library verilog;
use verilog.vl_types.all;
entity mux32_1 is
    port(
        sel             : in     vl_logic_vector(4 downto 0);
        \in\            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic
    );
end mux32_1;
