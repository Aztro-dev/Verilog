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

module main;
  reg clk, writeEnable;
  reg [2:0] writeAddr, readAddrA, readAddrB;
  reg [31:0] writeData;
  wire [31:0] rdA, rdB;
  reg [31:0] sum;
  regfile r (
      .clk(clk),
      .writeEnable(writeEnable),
      .writeAddr(writeAddr),
      .writeData(writeData),
      .readAddrA(readAddrA),
      .readAddrB(readAddrB),
      .rdA(rdA),
      .rdB(rdB)
  );

  initial $monitor($time, ": \tclk=%b, rdA=%x, rdB=%x, sum=%x", clk, rdA, rdB, sum);

  initial begin
    clk = 0;
    readAddrA = 3'b000;
    readAddrB = 3'b001;

    #0 writeEnable = 1'b1;
    writeAddr = 3'b000;
    writeData = 32'hFEDCBA98;
    clk = ~clk;

    #1 clk = ~clk;

    #1 writeEnable = 1'b1;
    writeAddr = 3'b001;
    writeData = 32'h12345678;
    clk = ~clk;

    #1 writeEnable = 1'b0;
    readAddrA = 3'b000;
    readAddrB = 3'b001;
    clk = ~clk;

    #1 clk = ~clk;
    sum = rdA + rdB;
  end
endmodule
