module ALU (
input [4:0] opcode,
input [2:0] func3,
input [6:0] func7,
input [31:0] operand1,
input [31:0] operand2,
output reg [31:0] alu_out
);
wire signed [31:0] op1_s, op2_s;
reg _;

assign op1_s = operand1;
assign op2_s = operand2;

always @(*) begin                                                                             // shift can only for 32 bits
    if (opcode == 5'b01100) begin                                                             // R type
        if (func7[5] == 0 && func3 == 3'b000)  {_, alu_out} = operand1 + operand2;                    // R: add
        else if (func7[5] == 1 && func3 == 3'b000)  {_, alu_out} = operand1 - operand2;               // R: sub
        else if (func7[5] == 0 && func3 == 3'b001)  alu_out = operand1 << operand2[4:0];         // R: sll
        else if (func7[5] == 0 && func3 == 3'b010)  alu_out = op1_s < op2_s;                     // R: slt
        else if (func7[5] == 0 && func3 == 3'b011)  alu_out = operand1 < operand2;               // R: sltu (default: unsigned)
        else if (func7[5] == 0 && func3 == 3'b100)  alu_out = operand1 ^ operand2;               // R: xor
        else if (func7[5] == 0 && func3 == 3'b101)  alu_out = operand1 >> operand2[4:0];         // R: srl
        else if (func7[5] == 1 && func3 == 3'b101)  alu_out = op1_s >>> operand2[4:0];           // R: sra
        else if (func7[5] == 0 && func3 == 3'b110)  alu_out = operand1 | operand2;               // R: or
        else if (func7[5] == 0 && func3 == 3'b111)  alu_out = operand1 & operand2;               // R: and
    end
    else if (opcode == 5'b00100) begin                                                        // I type
        if (func3 == 3'b000)  {_, alu_out} = operand1 + operand2;                                  // I: addi
        else if (func7[5] == 0 && func3 == 3'b001)  alu_out = operand1 << operand2[4:0];         // I: slli
        else if (func3 == 3'b010)  alu_out = op1_s < op2_s;                                   // I: slti
        else if (func3 == 3'b011)  alu_out = operand1 < operand2;                             // I: sltiu
        else if (func3 == 3'b100)  alu_out = operand1 ^ operand2;                             // I: xori
        else if (func7[5] == 0 && func3 == 3'b101)  alu_out = operand1 >> operand2[4:0];         // I: srli
        else if (func7[5] == 1 && func3 == 3'b101)  alu_out = op1_s >>> operand2[4:0];           // I: srai
        else if (func3 == 3'b110)  alu_out = operand1 | operand2;                             // I: ori
        else alu_out = operand1 & operand2;                             // I: andi
    end
    else if (opcode == 5'b00101)  {_, alu_out} = operand1 + operand2;                              // U: AUIPC                                                     
    else if (opcode == 5'b01101)  alu_out = operand2;                                         // U: LUI
    else if (opcode == 5'b11011 || opcode == 5'b11001)  {_, alu_out} = operand1 + 4;               // JALR , JAL
    else if (opcode == 5'b00000 || opcode == 5'b01000)  begin                                 // Load , Store
    	{_, alu_out} = operand1 + operand2;
    end
    else if (opcode == 5'b11000)  begin                                                       // Branch
        if (func3 == 3'b000)  alu_out = (operand1 == operand2);                               // B:beq
        else if (func3 == 3'b001)  alu_out = (operand1 != operand2);                          // B:bne
        else if (func3 == 3'b100)  alu_out = (op1_s < op2_s);                                 // B:blt
        else if (func3 == 3'b101)  alu_out = (op1_s >= op2_s);                                // B:bge
        else if (func3 == 3'b110)  alu_out = (operand1 < operand2);                           // B:bltu
        else if (func3 == 3'b111)  alu_out = (operand1 >= operand2);                          // B:bgeu
    end  
    
end

endmodule
