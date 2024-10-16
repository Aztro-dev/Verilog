`include "regfile.v"
`include "decode.v"

`define BITS

module main;
  parameter N `BITS = 32;
  reg clk;
  reg [31:0] opcode;
  reg [31:0] opcodes[3:0];
  wire [N - 1:0] result;

  decode #(
      .N(N)
  ) operation (
      .clk(clk),
      .opcode(opcode),
      .result(result)
  );

  initial $readmemb("rom.mem", opcodes, 0, 3);

  initial $monitor($time, ":\tclk=%x, opcode=%b, result=%b", clk, opcode, result);

  integer i;

  initial begin
    clk = 0;
    opcode = opcodes[0];
    for (i = 1; i < 4; i = i + 1) begin
      #1 clk = ~clk;
      opcode = opcodes[i];
    end
  end
endmodule
