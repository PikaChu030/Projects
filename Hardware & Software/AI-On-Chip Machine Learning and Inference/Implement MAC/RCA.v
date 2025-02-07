`include "FA.v"

module RCA
    #(parameter WIDTH = 8)
    (
        input [2*WIDTH-1:0] x,
        input [2*WIDTH-1:0] y,
        input cin,
        output [2*WIDTH-1:0] s,
        output cout);

    wire [2*WIDTH-1:0] carry;
    genvar i;
    generate
        for(i = 0; i < 2*WIDTH; i = i + 1)
        begin: generate_FA
            if(i == 0) begin
                FA fa0(
                    .x(x[0]),
                    .y(y[0]),
                    .cin(cin),
                    .s(s[0]),
                    .cout(carry[0])
                );
            end
            else begin
                FA fa0(
                    .x(x[i]),
                    .y(y[i]),
                    .cin(carry[i-1]),
                    .s(s[i]),
                    .cout(carry[i])
                );
            end
        end
    endgenerate

endmodule    