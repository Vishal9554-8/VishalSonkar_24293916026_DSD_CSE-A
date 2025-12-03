`timescale 1ns/1ps
module jk_ff(
    input  J, K, CLK,
    output Q, Qbar
);
    wire J_g, K_g;
   
    assign #1 J_g = J & CLK;
    assign #1 K_g = K & CLK;
    assign #1 Q    = ~( (J_g & Qbar) );
    assign #1 Qbar = ~( (K_g & Q)   );

endmodule
