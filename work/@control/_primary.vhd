library verilog;
use verilog.vl_types.all;
entity Control is
    port(
        instr           : in     vl_logic_vector(31 downto 0);
        zero            : in     vl_logic;
        negative        : in     vl_logic;
        Reg2Loc         : out    vl_logic;
        ALUsrc          : out    vl_logic;
        MemtoReg        : out    vl_logic;
        RegWri          : out    vl_logic;
        MemWri          : out    vl_logic;
        BrTaken         : out    vl_logic;
        UncondBr        : out    vl_logic;
        ALUOp           : out    vl_logic_vector(2 downto 0);
        Readmem         : out    vl_logic;
        ALUsrc1         : out    vl_logic;
        enFlags         : out    vl_logic;
        WriteRd         : out    vl_logic;
        BR              : out    vl_logic
    );
end Control;
