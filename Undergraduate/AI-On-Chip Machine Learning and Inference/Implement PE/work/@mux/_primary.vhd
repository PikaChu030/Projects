library verilog;
use verilog.vl_types.all;
entity Mux is
    port(
        sel             : in     vl_logic;
        a               : in     vl_logic_vector(23 downto 0);
        b               : in     vl_logic_vector(23 downto 0);
        c               : out    vl_logic_vector(23 downto 0)
    );
end Mux;
