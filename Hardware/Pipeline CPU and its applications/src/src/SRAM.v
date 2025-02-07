module SRAM (
input clk,
input [3:0] w_en,
input [15:0] address,
input [31:0] write_data,
output reg [31:0] read_data
);
reg [7:0] mem [0:65535];

always @(posedge clk) begin
    if (w_en[0] == 1)  mem[address] <= write_data[7:0];
    else               mem[address] <= mem[address];
    if (w_en[1] == 1)  mem[address + 1] <= write_data[15:8];
    else               mem[address + 1] <= mem[address + 1];
    if (w_en[2] == 1)  mem[address + 2] <= write_data[23:16];
    else               mem[address + 2] <= mem[address + 2];
    if (w_en[3] == 1)  mem[address + 3] <= write_data[31:24];
    else               mem[address + 3] <= mem[address + 3];
end

always @(*) begin
    read_data[7:0] = mem[address];
    read_data[15:8] = mem[address + 1];
    read_data[23:16] = mem[address + 2];
    read_data[31:24] = mem[address + 3];
end

endmodule