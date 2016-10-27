library verilog;
use verilog.vl_types.all;
entity Bit_Slice is
    port(
        sel             : in     vl_logic_vector(2 downto 0);
        a               : in     vl_logic;
        b               : in     vl_logic;
        cin             : in     vl_logic;
        cout            : out    vl_logic;
        sum             : out    vl_logic
    );
end Bit_Slice;
