`timescale 1ns / 1ps
module half_subtractor(
  input wire A,B,
  output wire D,Br);
  
  assign D  = A ^ B;    
  assign Br = (~A) & B;
endmodule
