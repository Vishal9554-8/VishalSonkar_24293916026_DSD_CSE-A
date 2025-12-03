`timescale 1ns/1ps
module sr_latch(
    input  S, R,
    output Q, Qbar
);

    assign #1 Q    = ~(S & Qbar);
    assign #1 Qbar = ~(R & Q);

endmodule
