`timescale 1ns/1ps
module sr_ff(
    input  S, R, CLK,
    output Q, Qbar
);
    wire S_g, R_g;
    assign #1 S_g = S & CLK;
    assign #1 R_g = R & CLK;

    assign #1 Q    = ~(S_g & Qbar);
    assign #1 Qbar = ~(R_g & Q);

endmodule
