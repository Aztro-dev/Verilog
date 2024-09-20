`include "regfile.v"
`include "decode.v"

module main;
  reg clk;
  reg [31:0] opcode;
  wire [31:0] result;

  decode operation (
      .clk(clk),
      .opcode(opcode),
      .result(result)
  );

  initial $monitor($time, ":\tclk=%x, opcode=%b, result=%b", clk, opcode, result);

  initial begin
    clk = 0;
    // add r1, r1, r2
    opcode = 32'b0000000_00000_00001_00000_000_0110011;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
  end
endmodule
