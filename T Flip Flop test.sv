`timescale 1ns/1ps
module tb_t_ff;

    reg T, CLK;
    wire Q, Qbar;

    t_ff uut (T, CLK, Q, Qbar);

    // Clock generation
    initial begin
        CLK = 1;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("t_ff.vcd");
        $dumpvars(0, tb_t_ff);

        T = 0; #10;
        T = 1; #10;
        T = 1; #10;
        T = 0; #10;

        $finish;
    end

endmodule
