/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor : JulianaLu --------------------- //
// ---------------------- Version : v.2.00  ---------------------- //
// ---------------------- Date : 2022.02.15 ---------------------- //
// ----------------------       Min         ---------------------- //
/////////////////////////////////////////////////////////////////////

`define D_DataSize 10
module Min(d_0,
            d_1,
            d_2,
            d_3,
            d_4,
            d_5,
            d_6,
            d_7,
            out_index,
            out_distance);

  // ---------------------- input  ---------------------- //
  input  [`D_DataSize-1:0] d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7;

  // ---------------------- output ---------------------- //
  output reg [`D_DataSize-1:0] out_distance;
  output reg [2:0] out_index;

  // ---------------------- Write down Your design below  ---------------------- //

  wire   [`D_DataSize-1:0] temp_0,temp_1,temp_2,temp_3,temp_4,temp_5,temp_6,temp_7;
  wire   [`D_DataSize-1:0] dt;
  
  assign temp_0 = (d_0 <= d_1)? d_0 : d_1;
  assign temp_1 = (d_2 <= d_3)? d_2 : d_3;
  assign temp_2 = (d_4 <= d_5)? d_4 : d_5;
  assign temp_3 = (d_6 <= d_7)? d_6 : d_7;
  assign temp_4 = (temp_0 <= temp_1)? temp_0 : temp_1;
  assign temp_5 = (temp_2 <= temp_3)? temp_2 : temp_3;
  assign temp_6 = (temp_4 <= temp_5)? temp_4 : temp_5;
  
  always @(*) begin
    if (temp_6 == d_0) begin
        out_distance <= temp_6;
        out_index <= 3'd0;
    end
    else if (temp_6 == d_1) begin
        out_distance <= temp_6;
        out_index <= 3'd1;
    end
    else if (temp_6 == d_2) begin
        out_distance <= temp_6;
        out_index <= 3'd2;
    end
    else if (temp_6 == d_3) begin
        out_distance <= temp_6;
        out_index <= 3'd3;
    end
    else if (temp_6 == d_4) begin
        out_distance <= temp_6;
        out_index <= 3'd4;
    end
    else if (temp_6 == d_5) begin
        out_distance <= temp_6;
        out_index <= 3'd5;
    end
    else if (temp_6 == d_6) begin
        out_distance <= temp_6;
        out_index <= 3'd6;
    end
    else if (temp_6 == d_7) begin
        out_distance <= temp_6;
        out_index <= 3'd7;
    end
    else begin
        out_distance <= 10'd0;
        out_index <= 3'd7;
    end
  end
  endmodule
