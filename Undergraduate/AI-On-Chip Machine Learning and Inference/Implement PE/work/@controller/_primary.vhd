library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ifmap_enable    : in     vl_logic;
        weight_enable   : in     vl_logic;
        ipsum_enable    : in     vl_logic;
        iw_size         : in     vl_logic_vector(3 downto 0);
        c               : in     vl_logic_vector(3 downto 0);
        f               : in     vl_logic_vector(3 downto 0);
        n               : in     vl_logic_vector(3 downto 0);
        o               : in     vl_logic_vector(3 downto 0);
        opsum_ready     : in     vl_logic;
        ifmap_ready     : out    vl_logic;
        weight_ready    : out    vl_logic;
        ipsum_ready     : out    vl_logic;
        opsum_enable    : out    vl_logic;
        ifmap_addr      : out    vl_logic_vector(5 downto 0);
        ifmap_wen       : out    vl_logic;
        weight_addr     : out    vl_logic_vector(5 downto 0);
        weight_wen      : out    vl_logic;
        psum_addr       : out    vl_logic_vector(4 downto 0);
        psum_wen        : out    vl_logic;
        psum_ren        : out    vl_logic;
        mux1_sel        : out    vl_logic;
        mux2_sel        : out    vl_logic
    );
end Controller;
