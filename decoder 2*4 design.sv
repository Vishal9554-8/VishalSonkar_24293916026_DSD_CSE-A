module decoder2to4(
    input wire A, B,
    output wire D0, D1, D2, D3
);

assign D0 = ~A & ~B; 
assign D1 = ~A &  B; 
assign D2 =  A & ~B; 
assign D3 =  A &  B; 

endmodule
