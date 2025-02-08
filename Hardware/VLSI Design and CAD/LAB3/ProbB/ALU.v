/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor : CYLu     ---------------------- //
// ---------------------- Version : v.5.01  ---------------------- //
// ---------------------- Date : 2022.03.02 ---------------------- //
// ---------------------- ALU reference code  -------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

// ---------------------- define ---------------------- //

`define DataSize  32
`define ALUopSize  5
//define ALUop
`define ADDop     5'b00000
`define SUBop     5'b00001
`define ANDop     5'b00010
`define ORop      5'b00011
`define XORop     5'b00100
`define NORop     5'b00101
`define SRLop     5'b00110
`define ROTRop    5'b00111
//students should implement the following op code
`define NOTop     5'b01000
`define NANDop    5'b01001
`define MAXop     5'b01010
`define MINop     5'b01011
`define ABSop     5'b01100
`define SLTop     5'b01101
`define SLTUop    5'b01110
`define SRAop     5'b01111
`define SLLop     5'b10000
`define SLAop     5'b10001
`define ROTLop    5'b10010
`define ADDUop    5'b10011

module ALU (alu_enable, alu_op, src1, src2, alu_out, alu_overflow);

// ---------------------- input  ---------------------- //
  input                     alu_enable;
  input   [`ALUopSize-1:0]  alu_op;
  input   [`DataSize-1:0]   src1;
  input   [`DataSize-1:0]   src2;

  // ---------------------- output ---------------------- //
  output   [`DataSize-1:0]  alu_out;
  output                    alu_overflow;

  // ----------------------  reg   ---------------------- //
  reg    [`DataSize-1:0]    alu_out;
  reg                       alu_overflow;

  always@(*)begin
    if(alu_enable)begin
      case(alu_op)
        `ADDop  :  begin
          alu_out = src1 + src2;
          if((src1[31]==1'd0 && src2[31]==1'd0 && alu_out[31]==1'd1)||
            (src1[31]==1'd1 && src2[31]==1'd1 && alu_out[31]==1'd0)) begin
            alu_overflow = 1'b1;
          end
          else begin
            alu_overflow = 1'b0;
          end
        end
        `SUBop  :  begin
          alu_out = src1 - src2;
          if((src1[31]==1'd0 && src2[31]==1'd1 && alu_out[31]==1'd1)||
            (src1[31]==1'd1 && src2[31]==1'd0 && alu_out[31]==1'd0)) begin
            alu_overflow = 1'b1;
          end
          else begin
            alu_overflow = 1'b0;
          end
        end
        `ANDop  :  begin
          alu_out = src1 & src2;
          alu_overflow = 1'b0;
        end
        `ORop   :  begin
          alu_out = src1 | src2;
          alu_overflow = 1'b0;
        end
        `XORop  :  begin
          alu_out = src1 ^ src2;
          alu_overflow = 1'b0;
        end
        `NORop  :  begin
          alu_out = ~(src1 | src2);
          alu_overflow = 1'b0;
        end
        `SRLop  :  begin
          alu_out = src1 >> src2;
          alu_overflow = 1'b0;
        end
        `ROTRop :  begin
          alu_out = {src1,src1} >> (src2%32);
          alu_overflow = 1'b0;
        end
 // ---------------------- Write down Your design below  ---------------------- //
        `NOTop  : begin
          alu_out = ~src1;
          alu_overflow = 1'b0;
        end
        `NANDop : begin
          alu_out = ~(src1&src2);
          alu_overflow = 1'b0;
        end
        `MAXop  : begin
          if (src1[31] == src2[31]) begin
            if (src1 > src2) begin
              alu_out = src1;
              alu_overflow = 1'b0;
            end
            else if (src1 < src2) begin
              alu_out = src2;
              alu_overflow = 1'b0;
            end
          end
          else if (src1[31] == 1'b0 && src2[31] == 1'b1) begin
            alu_out = src1;
            alu_overflow = 1'b0;
          end
          else if (src1[31] == 1'b1 && src2[31] == 1'b0) begin
            alu_out = src2;
            alu_overflow = 1'b0;
          end
        end
        `MINop  : begin
          if (src1[31] == src2[31]) begin
            if (src1 > src2) begin
              alu_out = src2;
              alu_overflow = 1'b0;
            end
            else if (src1 < src2) begin
              alu_out = src1;
              alu_overflow = 1'b0;
            end
          end
          else if (src1[31] == 1'b0 && src2[31] == 1'b1) begin
            alu_out = src2;
            alu_overflow = 1'b0;
          end
          else if (src1[31] == 1'b1 && src2[31] == 1'b0) begin
            alu_out = src1;
            alu_overflow = 1'b0;
          end
        end
        `ABSop  : begin
          if (src1[31] == 1'd0) begin
          alu_out = src1;
          alu_overflow = 1'b0;
          end
          else if (src1[31] == 1'd1) begin
          alu_out = ~(src1 -1) ;
          alu_overflow = 1'b0;
          end
        end
        `SLTop : begin
          if (src1[31] == 1'd0 && src2[31] == 1'd0) begin
          alu_out = (src1<src2)?1:0;
          alu_overflow = 1'b0;
          end
          else if (src1[31] == 1'd1 && src2[31] == 1'd1) begin
          alu_out = (~src1 + 1 < ~src2 + 1)?1:0;
          alu_overflow = 1'b0;
          end
          else if (src1[31] == 1'd0 && src2[31] == 1'd1) begin
          alu_out = 32'd1;
          alu_overflow = 1'b0;
          end
          else if (src1[31] == 1'd1 && src2[31] == 1'd0) begin
          alu_out = 32'd1;
          alu_overflow = 1'b0;
          end
        end
        `SLTUop : begin
          alu_out = (src1<src2)?1:0;
          alu_overflow = 1'b0;
        end
        `SRAop : begin
          alu_out = $signed(src1) >>> src2;
          alu_overflow = 1'b0;
        end
        `SLLop : begin
          alu_out = src1 << src2;
          alu_overflow = 1'b0;
        end
        `SLAop : begin
          alu_out = src1 <<< src2;
          alu_overflow = 1'b0;
        end
        `ROTLop : begin
          alu_out = (src1 << src2)|(src1 >> 32 - src2);
          alu_overflow = 1'b0;
        end
        `ADDUop : begin
          alu_out = src1 + src2;
          alu_overflow = 1'b0; 
        end
        default :  begin
          alu_out = 32'b0;
          alu_overflow = 1'b0;
        end
      endcase
    end
    else begin
      alu_out = 32'b0;
      alu_overflow = 1'b0;
    end
  end
endmodule
