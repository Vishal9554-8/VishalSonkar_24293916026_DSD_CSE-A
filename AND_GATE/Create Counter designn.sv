`timescale 1ns/1ps
module counter(
    input  wire CLK,
    input  wire RESET,     // Active-high synchronous reset
    output reg  [3:0] Q
);

    // Initialize counter
    initial Q = 4'b0000;

    // Count on every rising edge
    always @(posedge CLK) begin
        if (RESET)
            Q <= 4'b0000;      // Reset to 0
        else
            Q <= Q + 1;        // Increment
    end

endmodule
