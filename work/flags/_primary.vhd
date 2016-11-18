library verilog;
use verilog.vl_types.all;
entity flags is
    port(
        en              : in     vl_logic;
        negative        : in     vl_logic;
        zero            : in     vl_logic;
        overflow        : in     vl_logic;
        carry_out       : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        q               : out    vl_logic_vector(3 downto 0)
    );
end flags;
