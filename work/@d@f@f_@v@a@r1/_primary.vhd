library verilog;
use verilog.vl_types.all;
entity DFF_VAR1 is
    generic(
        WIDTH           : integer := 64
    );
    port(
        en              : in     vl_logic;
        q               : out    vl_logic_vector;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        data            : in     vl_logic_vector(63 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end DFF_VAR1;
