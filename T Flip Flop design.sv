`timescale 1ns/1ps
module t_ff(
    input T,
    input CLK,
    output reg Q,
    output Qbar
);

    initial Q = 1'b0;

    // Toggle on negative clock edge
    always @(negedge CLK) begin
        if (T)
            Q <= ~Q;
        else
            Q <= Q;   // Hold
    end

    assign Qbar = ~Q;

endmodule  
