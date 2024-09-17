module regfile (
    input clk,
    input writeEnable,
    input [2:0] writeAddr,
    input [31:0] writeData,
    input [2:0] readAddrA,
    input [2:0] readAddrB,
    output [31:0] rdA,
    output [31:0] rdB
);

  reg [31:0] regfile[8];

  assign rdA = regfile[readAddrA];
  assign rdB = regfile[readAddrB];

  always @(posedge clk) begin
    if (writeEnable) regfile[writeAddr] = writeData;
  end

endmodule
