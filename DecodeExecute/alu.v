`define BITS

module alu #(
    parameter `BITS N
) (
    input  [N-1:0] a,
    input  [N-1:0] b,
    input  [ 13:0] opcode,
    output [N-1:0] result
);
  wire [N:0] carry;
  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : gen_add
      full_adder f (
          .a(a[i]),
          .b(b[i]),
          .cin(carry[i]),
          .sum(result[i]),
          .cout(carry[i+1])
      );
    end
  endgenerate
endmodule

module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
  assign sum  = a ^ b ^ cin;
  assign cout = (a & cin) | (b & cin) | (a & b);
endmodule
