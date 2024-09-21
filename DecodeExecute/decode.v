`include "alu.v"

module decode (
    input clk,
    input [31:0] opcode,
    output [31:0] result
);
  generate
    wire [4:0] addr_a, addr_b, addr_ret;
    assign addr_a   = opcode[24:20];
    assign addr_b   = opcode[19:15];
    assign addr_ret = opcode[6:0];
    wire [31:0] a, b;
    regfile regop (
        .clk(clk),
        .readAddrA(addr_a),
        .readAddrB(addr_b),
        .rdA(a),
        .rdB(b)
    );
    assign a = 32'h01;
    assign b = 32'h10;
    wire [13:0] trimmed_opcode;
    assign trimmed_opcode = {opcode[31:25], opcode[6:0]};
    alu aluop (
        .a(a),
        .b(b),
        .opcode(trimmed_opcode),
        .result(result)
    );

    wire write_enable;
    assign write_enable = 1'b1;
    regfile store (
        .clk(clk),
        .writeEnable(write_enable),
        .writeAddr(addr_ret),
        .writeData(result[31:0]),
        .rdA(a),
        .rdB(b)
    );
  endgenerate

endmodule
