module A (
    input  [31:0] a,
    input  [31:0] b,
    output [32:0] c
);

  assign c = a + b;
endmodule

module main;
  reg  [31:0] regfile[2];
  wire [32:0] c;

  A a1 (
      .a(regfile[0]),
      .b(regfile[1]),
      .c(c)
  );

  initial $monitor($time, "a=%x,b=%x,c=%x", regfile[0], regfile[1], c);

  initial begin
    #0 regfile[0] = 32'hDEADBEEF;
    regfile[1] = 32'hBEEFDEAD;

    #4 regfile[0] = 32'hFFFFFFFF;
    regfile[1] = 32'h0001;

    #4 regfile[0] = 1'b0;
    regfile[1] = 1'b1;

    #4 regfile[0] = 1'b1;
    regfile[1] = 1'b1;
  end
endmodule
