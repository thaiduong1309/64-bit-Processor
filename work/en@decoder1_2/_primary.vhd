library verilog;
use verilog.vl_types.all;
entity enDecoder1_2 is
    port(
        en              : in     vl_logic;
        \in\            : in     vl_logic;
        \out\           : out    vl_logic_vector(1 downto 0)
    );
end enDecoder1_2;
