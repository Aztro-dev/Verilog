`include "alu.v"
`define BITS

module decode #(
    parameter `BITS N = 32
) (
    input clk,
    input [31:0] opcode,
    output [N-1:0] result
);
  generate
    wire [4:0] addr_a, addr_b, addr_ret;
    assign addr_a   = opcode[24:20];
    assign addr_b   = opcode[19:15];
    assign addr_ret = opcode[6:0];
    wire [N-1:0] a, b;
    
    regfile regop (
        .clk(clk),
        .readAddrA(addr_a),
        .readAddrB(addr_b),
        .rdA(a),
        .rdB(b)
    );

    wire [13:0] trimmed_opcode;
    assign trimmed_opcode = {opcode[31:25], opcode[6:0]};
    alu #(
        .N(N)
    ) aluop (
        .a(a),
        .b(b),
        .opcode(trimmed_opcode),
        .result(result)
    );
  endgenerate

endmodule
