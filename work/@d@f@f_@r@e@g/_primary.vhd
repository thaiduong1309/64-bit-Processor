library verilog;
use verilog.vl_types.all;
entity DFF_REG is
    port(
        q               : out    vl_logic_vector(31 downto 0);
        d               : in     vl_logic_vector(31 downto 0);
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end DFF_REG;
