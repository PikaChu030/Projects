module PSpad
#(
    parameter WIDTH = 24,
    parameter ADDR  = 5,
    parameter SIZE = 32)
(
    input clk,
    input wen,
    input ren,
    input [WIDTH-1:0] wrdata,
    input [ADDR-1:0] addr,
    output [WIDTH-1:0] rdata
);
    
    reg [WIDTH-1:0] mem [SIZE-1:0];

    //reg [WIDTH-1:0] rdata_reg;
    //assign rdata = rdata_reg;

    // read
    assign rdata = (ren) ? mem[addr] : 'hz;

    // write
    always@(posedge clk) 
    begin: do_write
        if(wen) mem[addr] <= wrdata;
    end
    



endmodule