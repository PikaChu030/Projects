module gen_prod 
    # (parameter WIDTH = 8)
    (
        input signed [WIDTH-1:0] M,
        input neg,
        input zero,
        input two,
        input one,
        output signed [2*WIDTH-1:0] prod
    );

    `define NUM1 2*WIDTH
    `define NUM2 2*WIDTH-1
    `define NUM3 2*WIDTH

    reg signed [`NUM3-1:0] prod_reg;
    
    
    always @(*) begin
        if(zero) prod_reg = 'd0;
        else if(one && neg) prod_reg = ~{{5'd8{M[WIDTH-1]}}, M} + 'd1;
        else if(two && neg) prod_reg = ~{{4'd7{M[WIDTH-1]}}, M, 1'b0} + 'd1;
        else if(one) prod_reg =  {{5'd16{M[WIDTH-1]}}, M};
        else prod_reg = {{4'd7{M[WIDTH-1]}}, M, 1'b0}; // only two
    end
    

    assign prod = prod_reg;

endmodule