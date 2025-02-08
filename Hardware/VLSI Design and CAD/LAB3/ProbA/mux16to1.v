module mux16to1 (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, sel, Q);

  input A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;
  input [3:0] sel;
  output Q;

 // ---------------------- Write down Your design below  ---------------------- //
  reg Q;
  always @(*) begin
    case(sel)
    4'd0:Q = A;
    4'd1:Q = B;
    4'd2:Q = C;
    4'd3:Q = D;
    4'd4:Q = E;
    4'd5:Q = F;
    4'd6:Q = G;
    4'd7:Q = H;
    4'd8:Q = I;
    4'd9:Q = J;
    4'd10:Q = K;
    4'd11:Q = L;
    4'd12:Q = M;
    4'd13:Q = N;
    4'd14:Q = O;
    4'd15:Q = P;
    endcase
  end
 
endmodule
