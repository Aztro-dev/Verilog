module alu (
    input  [31:0] a,
    input  [31:0] b,
    input  [13:0] opcode,
    output [31:0] result
);
  assign result = a | opcode;
endmodule
