module RegFile (
input clk,
input rst,
input wb_en,
input [31:0] wb_data,
input [4:0] rd_index,
input [4:0] rs1_index,
input [4:0] rs2_index,
output reg [31:0] rs1_data_out,
output reg [31:0] rs2_data_out
);
reg [31:0] registers [0:31];

always @(posedge clk or posedge rst) begin
    if (rst)begin
        registers[0] <= 0;
        registers[1] <= 0;
        registers[2] <= 0;
        registers[3] <= 0;
        registers[4] <= 0;
        registers[5] <= 0;
        registers[6] <= 0;
        registers[7] <= 0;
        registers[8] <= 0;
        registers[9] <= 0;
        registers[10] <= 0;
        registers[11] <= 0;
        registers[12] <= 0;
        registers[13] <= 0;
        registers[14] <= 0;
        registers[15] <= 0;
        registers[16] <= 0;
        registers[17] <= 0;
        registers[18] <= 0;
        registers[19] <= 0;
        registers[20] <= 0;
        registers[21] <= 0;
        registers[22] <= 0;
        registers[23] <= 0;
        registers[24] <= 0;
        registers[25] <= 0;
        registers[26] <= 0;
        registers[27] <= 0;
        registers[28] <= 0;
        registers[29] <= 0;
        registers[30] <= 0;
        registers[31] <= 0;
    end
    else if (wb_en == 1 && rd_index != 5'b0) begin     // x0 cannot be overwrite
        registers[rd_index] <= wb_data;
    end
end

always @(*) begin
    rs1_data_out = registers[rs1_index];
    rs2_data_out = registers[rs2_index];
end

endmodule