`include "FA.v"
module CSA
    # (parameter WIDTH = 8)
    (
        input [2*WIDTH-1:0] x,
        input [2*WIDTH-1:0] y,
        input [2*WIDTH-1:0] z,
        output [2*WIDTH-1:0] s,
        output [2*WIDTH-1:0] c
    );

    genvar i;
    generate
        for(i = 0; i < 2*WIDTH; i = i + 1) 
        begin: generate_FA
            FA fa(
                .x(x[i]),
                .y(y[i]),
                .cin(z[i]),
                .s(s[i]),
                .cout(c[i])
            );
        end
    endgenerate
    
endmodule