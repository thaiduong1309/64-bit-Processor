library verilog;
use verilog.vl_types.all;
entity enDecoder2_4 is
    port(
        en              : in     vl_logic;
        \in\            : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end enDecoder2_4;
