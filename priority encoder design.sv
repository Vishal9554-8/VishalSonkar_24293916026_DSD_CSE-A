`timescale 1ns/1ps
module priority_encoder_4to2(
    input  I0, I1, I2, I3,
    output Y1, Y0,
    output valid
);
    assign Y1   = I3 | I2;
    assign Y0   = I3 | (~I2 & I1);
    assign valid = I0 | I1 | I2 | I3;

endmodule
