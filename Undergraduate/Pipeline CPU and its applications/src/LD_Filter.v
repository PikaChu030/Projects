module LD_Filter (
input [2:0] func3,
input [31:0] ld_data,
output reg [31:0] ld_data_f
);

always @ (*) begin
    if (func3 == 3'b000) ld_data_f = {{24{ld_data[31]}}, ld_data[7:0]};           // lb
    else if (func3 == 3'b001)  ld_data_f = {{16{ld_data[31]}}, ld_data[15:0]};    // lh
    else if (func3 == 3'b010)  ld_data_f = ld_data;                               // lw
    else if (func3 == 3'b100)  ld_data_f = {24'b0, ld_data[7:0]};                 // lbu
    else if (func3 == 3'b101)  ld_data_f = {16'b0, ld_data[15:0]};                // lhu
    else                       ld_data_f = 32'd0;
end

endmodule