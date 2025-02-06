module booth_enc(
    input [2:0] code,
    output neg,
    output zero,
    output two,
    output one);

    assign neg = (code[2]) ? 1'b1: 1'b0;
    assign zero = (code == 3'b000 || code == 3'b111) ? 1'b1 : 1'b0;
    assign two = (code == 3'b011 || code == 3'b100) ? 1'b1 : 1'b0;
    assign one = (!zero) & (!two);

endmodule