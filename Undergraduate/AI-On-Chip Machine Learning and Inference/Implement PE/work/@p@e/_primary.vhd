library verilog;
use verilog.vl_types.all;
entity PE is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ifmap_noc       : in     vl_logic_vector(7 downto 0);
        ifmap_enable    : in     vl_logic;
        weight_noc      : in     vl_logic_vector(7 downto 0);
        weight_enable   : in     vl_logic;
        ipsum_noc       : in     vl_logic_vector(23 downto 0);
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
        opsum_noc       : out    vl_logic_vector(23 downto 0)
    );
end PE;
