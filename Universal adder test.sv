`timescale 1ns/1ps
module tb_universal_full_adder_nand_overflow;

    reg A, B, Cin;
    wire Sum, Cout, Overflow;

    universal_full_adder_nand_overflow uut(A, B, Cin, Sum, Cout, Overflow);

    initial begin
        $dumpfile("universal_fa_nand_overflow.vcd");
        $dumpvars(0, tb_universal_full_adder_nand_overflow);
    end

    integer i;

    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i;
            #10;
        end
        #10;
        $finish;
    end

endmodule
