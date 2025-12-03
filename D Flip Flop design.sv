`timescale 1ns/1ps
module d_ff_neg (
    input  D,
    input  CLK,
    output reg Q
);
    always @(negedge CLK)
        Q <= D;
endmodule
