`define BITS

module regfile #(
    parameter `BITS N = 32
) (
    input clk,
    input writeEnable,
    input [4:0] writeAddr,
    input [N - 1:0] writeData,
    input [4:0] readAddrA,
    input [4:0] readAddrB,
    output [N - 1:0] rdA,
    output [N - 1:0] rdB
);
    reg [N - 1:0] regfile[31:0];


    assign rdA = regfile[readAddrA];
    assign rdB = regfile[readAddrB];

    integer i;
    always @(posedge clk) begin
        if (writeEnable) regfile[writeAddr] = writeData;
        // Set zero register to always be zero
        for (i = 0; i < N; i = i + 1) begin 
            regfile[0][i] <= 1'b0;
        end
    end

endmodule
