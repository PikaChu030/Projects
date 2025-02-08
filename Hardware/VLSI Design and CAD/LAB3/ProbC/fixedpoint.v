module fixedpoint(int_in,result);

input [7:0] int_in;
output [7:0] result;

 // ---------------------- Write down Your design below  ---------------------- //

wire [7:0] multi ;
wire [15:0] temp;
assign multi = 8'b01011001;
assign temp = multi*int_in;
assign result = (temp[6] == 1'b0)?temp[14:7]:temp[14:7]+ 8'b1;
endmodule
