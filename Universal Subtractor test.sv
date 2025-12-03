`timescale 1ns/1ps
module tb_universal_subtractor_overflow;

    reg  [3:0] A, B;
    wire [3:0] Diff;
    wire BorrowOut, Overflow;

    universal_subtractor_overflow uut(
        .A(A),
        .B(B),
        .Diff(Diff),
        .BorrowOut(BorrowOut),
        .Overflow(Overflow)
    );

    initial begin
        $dumpfile("universal_subtractor_overflow.vcd");
        $dumpvars(0, tb_universal_subtractor_overflow);

        // Normal subtraction (no overflow)
        A = 4'd9;  B = 4'd3;  #10;   // 9 - 3 = 6

        // Borrow required (unsigned wrap)
        A = 4'd4;  B = 4'd6;  #10;   // 4 - 6 = borrow

        // Overflow case: positive - negative → positive overflow
        A = 4'b0111; B = 4'b1000; #10; // 7 - (-8) = 15 (overflow)

        // Overflow case: negative - positive → negative overflow
        A = 4'b1000; B = 4'b0111; #10; // -8 - 7 = -15 (overflow)

        // Zero result
        A = 4'd8;  B = 4'd8;   #10;

        $finish;
    end

endmodule
