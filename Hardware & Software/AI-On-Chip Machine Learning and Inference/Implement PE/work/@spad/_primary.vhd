library verilog;
use verilog.vl_types.all;
entity Spad is
    generic(
        WIDTH           : integer := 8;
        \ADDR\          : integer := 6;
        SIZE            : integer := 64
    );
    port(
        clk             : in     vl_logic;
        wen             : in     vl_logic;
        wrdata          : in     vl_logic_vector;
        addr            : in     vl_logic_vector;
        rdata           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of \ADDR\ : constant is 1;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end Spad;
