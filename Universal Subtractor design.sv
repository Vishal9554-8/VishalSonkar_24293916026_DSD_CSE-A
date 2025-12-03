`timescale 1ns/1ps
module universal_subtractor_overflow(
    input  wire [3:0] A,
    input  wire [3:0] B,
    output wire [3:0] Diff,
    output wire BorrowOut,
    output wire Overflow
);

    // Two's complement of B = (~B + 1)
    wire [3:0] B_comp;
    assign B_comp = ~B;

    // Perform A + (~B + 1)
    wire [4:0] Sum;
    assign Sum = {1'b0, A} + {1'b0, B_comp} + 1;

    // Difference output
    assign Diff = Sum[3:0];

    // BorrowOut = NOT (carry out)
    assign BorrowOut = ~Sum[4];

    // Signed Overflow check:
    // Overflow = (A[3] != B[3]) AND (Diff[3] != A[3])
    assign Overflow = (A[3] ^ B[3]) & (Diff[3] ^ A[3]);

endmodule
