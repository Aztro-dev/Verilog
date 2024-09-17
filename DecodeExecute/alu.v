module alu(
  input [31:0] a, b,
  input [6:0] opcode,
  output [31:0] result
);
  assign result = a & b + opcode;
endmodule
