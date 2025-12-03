`timescale 1ns/1ps
module tb_counter;

    reg CLK, RESET;
    wire [3:0] Q;

    counter uut (
        .CLK(CLK),
        .RESET(RESET),
        .Q(Q)
    );

    // Clock generation (10 ns period)
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, tb_counter);

        // Start with reset ON
        RESET = 1; #15;

        // Disable reset → counter starts incrementing
        RESET = 0; #80;

        // Trigger reset again while running
        RESET = 1; #10;
        RESET = 0; #40;

        $finish;
    end

endmodule
