`include "Booth_enc.v"
`include "Gen_prod.v"
`include "CSA.v"
`include "RCA.v"
module MAC
    # (parameter WIDTH = 8)
    (
        input signed [WIDTH-1:0] ifmap,
        input signed [WIDTH-1:0] filter,
        input signed [3*WIDTH-1:0] psum,
        output signed [3*WIDTH-1:0] updated_psum
    );

    // M --> ifmap
    // R --> filter
    // C --> psum
    // result --> updated_psum

    `define N  WIDTH/2
    wire [`N-1:0] neg, zero, one, two;
    genvar  i;
    integer  j;
    reg signed [3*WIDTH-1:0] result_reg;
    wire signed [2*WIDTH-1:0] prod [`N-1:0];


    generate
        for(i = 0; i < `N; i = i + 1) 
        begin: Booth_enc_generator
            if(i == 0) begin
                booth_enc u_booth_enc(
                    .code   ({filter[1:0], 1'b0}),
                    .neg    (neg[i]),
                    .zero   (zero[i]),
                    .two    (two[i]),
                    .one    (one[i])
                );
            end
            else begin
                booth_enc u_booth_enc(
                    .code   (filter[(i*2+1):(i*2-1)]),
                    .neg    (neg[i]),
                    .zero   (zero[i]),
                    .two    (two[i]),
                    .one    (one[i])
                );
            end
        end
    endgenerate

    
    generate
        for(i = 0; i < `N; i= i + 1) 
        begin: Gen_prod_generator
            gen_prod u_gen_prod(
                .M      (ifmap),
                .neg    (neg[i]),
                .zero   (zero[i]),
                .one    (one[i]),
                .two    (two[i]),
                .prod   (prod[i])
            );
        end
    endgenerate 

    /*------Simple addition---------*/
    /*
    always @(*) begin
        for(j = 0; j < `N; j = j + 1) begin
            if(j == 0) begin
                result_reg = prod[0];
            end
            else begin
                case(j)
                    32'd1: result_reg = result_reg + (prod[j] << 2);
                    32'd2: result_reg = result_reg + (prod[j] << 4);
                    32'd3: result_reg = result_reg + (prod[j] << 6);
                    default: result_reg = result_reg + 'd0;
                endcase
            end
        end
    end
    */

    /*------Carry Save Adder---------*/
    wire signed [2*WIDTH-1:0] sum0, sum1, carry0, carry1, mult_res;
    wire signed [3*WIDTH-1:0] add_res;
    wire cout0, cout1;
    CSA csa0(
        .x(prod[0]),
        .y(prod[1] << 2),
        .z(prod[2] << 4),
        .s(sum0),
        .c(carry0)
    );
    CSA csa1(
        .x(prod[3] << 6),
        .y(sum0),
        .z(carry0 << 1),
        .s(sum1),
        .c(carry1)
    );
    RCA rca0(
        .x(sum1),
        .y(carry1 << 1),
        .cin(1'b0),
        .s(mult_res),
        .cout(cout0)
    );

    assign add_res = {{4'd8{mult_res[2*WIDTH-1]}}, mult_res};
    RCA #(.WIDTH(3*WIDTH))
    rca1
    (
        .x(add_res),
        .y(psum),
        .cin(1'b0),
        .s(updated_psum),
        .cout(cout1)
    );

    
    //assign updated_psum = result_reg + psum;

endmodule