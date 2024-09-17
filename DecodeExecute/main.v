`include "regfile.v"
`include "alu.v"

module main;
  reg clk;
  reg [31:0] a, b;
  reg  [ 7:0] opcode;
  wire [31:0] result;

  alu aluOperation (
      .a(a),
      .b(b),
      .opcode(opcode),
      .result(result)
  );

  initial $monitor($time, ":\tclk=%x, a=%x, b=%x, opcode=%b, result=%x", clk, a, b, opcode, result);

  initial begin
    clk = 0;
    opcode = 8'b0000_0000;
    a = 32'hFF00FF00;
    b = 32'h00FF00FF;
  end
endmodule
