library verilog;
use verilog.vl_types.all;
entity PSpad is
    generic(
        WIDTH           : integer := 24;
        \ADDR\          : integer := 5;
        SIZE            : integer := 32
    );
    port(
        clk             : in     vl_logic;
        wen             : in     vl_logic;
        ren             : in     vl_logic;
        wrdata          : in     vl_logic_vector;
        addr            : in     vl_logic_vector;
        rdata           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of \ADDR\ : constant is 1;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end PSpad;
