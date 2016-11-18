library verilog;
use verilog.vl_types.all;
entity enDecoder5_32 is
    port(
        en              : in     vl_logic;
        \in\            : in     vl_logic_vector(4 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end enDecoder5_32;
