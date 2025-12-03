`timescale 1ns/1ps

module priority_encoder_4to2_tb;
    reg I0, I1, I2, I3;
    wire Y1, Y0, valid;
    priority_encoder_4to2 dut(I0, I1, I2, I3, Y1, Y0, valid);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, priority_encoder_4to2_tb);
    end

    initial begin
        I0=0; I1=0; I2=0; I3=0;   #10;
        I0=1; I1=0; I2=0; I3=0;   #10;
        I0=0; I1=1; I2=0; I3=0;   #10;
        I0=1; I1=1; I2=0; I3=0;   #10;
        I0=0; I1=0; I2=1; I3=0;   #10;
        I0=1; I1=0; I2=1; I3=0;   #10;
        I0=1; I1=1; I2=1; I3=0;   #10;
        I0=0; I1=0; I2=0; I3=1;   #10;
        I0=1; I1=0; I2=0; I3=1;   #10;
        I0=1; I1=1; I2=0; I3=1;   #10;
        I0=0; I1=1; I2=1; I3=1;   #10;
        I0=1; I1=1; I2=1; I3=1;   #10;

        $finish;
    end

endmodule
