library verilog;
use verilog.vl_types.all;
entity DFF_REG is
    port(
        en              : in     vl_logic_vector(31 downto 0);
        q               : out    vl_logic_vector(31 downto 0);
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(63 downto 0)
    );
end DFF_REG;
