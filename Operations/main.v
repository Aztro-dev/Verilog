module A (
    input a,
    input b,
    output [1:0] c
);

  assign c = a + b;
endmodule

module main;
  reg a, b;
  wire [1:0] c;

  A a1 (
      .a(a),
      .b(b),
      .c(c)
  );

  initial $monitor($time, "a=%b,b=%b,c=%b", a, b, c);

  initial begin
    #0 a = 1'b0;
    b = 1'b0;

    #1 a = 1'b1;
    b = 1'b0;

    #1 a = 1'b0;
    b = 1'b1;

    #1 a = 1'b1;
    b = 1'b1;
  end
endmodule
