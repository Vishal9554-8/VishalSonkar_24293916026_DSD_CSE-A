`timescale 1ns/1ps
module universal_full_adder_nand_overflow(
    input  A,
    input  B,
    input  Cin,
    output Sum,
    output Cout,
    output Overflow
);
    // XOR using NAND gates (A ⊕ B)
    wire n1_ab, n2_ab, n3_ab, xor_ab;
    nand(n1_ab, A, B);
    nand(n2_ab, A, n1_ab);
    nand(n3_ab, B, n1_ab);
    nand(xor_ab, n2_ab, n3_ab);    

    // XOR of xor_ab and Cin → Sum
    wire n1_sum, n2_sum, n3_sum;
    nand(n1_sum, xor_ab, Cin);
    nand(n2_sum, xor_ab, n1_sum);
    nand(n3_sum, Cin, n1_sum);
    nand(Sum, n2_sum, n3_sum);     

    // Carry-out logic
    wire nand_ab; 
    wire and_ab;
    nand(nand_ab, A, B);           
    nand(and_ab, nand_ab, nand_ab);

    wire nand_xc, and_xc;
    nand(nand_xc, xor_ab, Cin);    
    nand(and_xc, nand_xc, nand_xc);

    wire not_and_ab, not_and_xc;
    nand(not_and_ab, and_ab, and_ab); 
    nand(not_and_xc, and_xc, and_xc); 

    nand(Cout, not_and_ab, not_and_xc); 

    // Overflow logic: Overflow = Cout ⊕ Cin
    wire n1_ov, n2_ov, n3_ov;
    nand(n1_ov, Cin, Cout);
    nand(n2_ov, Cin, n1_ov);
    nand(n3_ov, Cout, n1_ov);
    nand(Overflow, n2_ov, n3_ov); 
endmodule
