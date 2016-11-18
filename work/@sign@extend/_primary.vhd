library verilog;
use verilog.vl_types.all;
entity SignExtend is
    port(
        instr           : in     vl_logic_vector(31 downto 0);
        DAddr9          : out    vl_logic_vector(63 downto 0);
        CondAddr19      : out    vl_logic_vector(63 downto 0);
        BrAddr26        : out    vl_logic_vector(63 downto 0);
        Imm12           : out    vl_logic_vector(63 downto 0)
    );
end SignExtend;
