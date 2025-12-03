`timescale 1ns/1ps
module tb_jk_ff;

    reg J, K, CLK;
    wire Q, Qbar;

    jk_ff uut (J, K, CLK, Q, Qbar);

    initial begin
        $dumpfile("jk_ff_wave.vcd");
        $dumpvars(0, tb_jk_ff);
    end

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        J = 0; K = 0; #10;   
        J = 0; K = 1; #10;   
        J = 1; K = 0; #10;   
        J = 1; K = 1; #10;  
        J = 1; K = 1; #10;   
        $finish;
    end

endmodule
