module Spad
#(
    parameter WIDTH = 8,
    parameter ADDR  = 6,
    parameter SIZE = 64)
(
    input clk,
    input wen,
    input [WIDTH-1:0] wrdata,
    input [ADDR-1:0] addr,
    output [WIDTH-1:0] rdata
);
    
    reg [WIDTH-1:0] mem [SIZE-1:0];

    //reg [WIDTH-1:0] rdata_reg;
    //assign rdata = rdata_reg;

    // read
    assign rdata = (!wen) ? mem[addr] : 'hz;

    // write
    always@(posedge clk) 
    begin: do_write
        if(wen) mem[addr] <= wrdata;
    end
    



endmodule