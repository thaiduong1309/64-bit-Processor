library verilog;
use verilog.vl_types.all;
entity subs is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        cin             : in     vl_logic;
        sum             : out    vl_logic;
        cout            : out    vl_logic
    );
end subs;
