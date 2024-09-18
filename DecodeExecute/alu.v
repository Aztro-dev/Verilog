module alu_reg(
  input [31:0] a, b,
  input [6:0] opcode,
  output [31:0] result
);
  always @(a, b, opcode) begin
  case (opcode) begin
    7'b0110011 : result = a + b;
    default: result = a | b & opcode;
  endcase
  end
endmodule
