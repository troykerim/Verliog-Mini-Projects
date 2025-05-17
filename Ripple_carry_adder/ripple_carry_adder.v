`timescale 1ns / 1ps

// 4 Bit RCA

module ripple_carry_adder(
    input [3:0]A,
    input [3:0]B,
    input CIN,
    output [3:0]SUM,
    output CARRY
    );
    
    wire [2:0] CIN_temp;  // Internal Carry outs/ins for each FA
    
    full_adder FA0(.A(A[0]), .B(B[0]), .CIN(CIN), .SUM(SUM[0]), .CARRY(CIN_temp[0]));
    full_adder FA1(.A(A[1]), .B(B[1]), .CIN(CIN_temp[0]), .SUM(SUM[1]), .CARRY(CIN_temp[1]));    
    full_adder FA2(.A(A[2]), .B(B[2]), .CIN(CIN_temp[1]), .SUM(SUM[2]), .CARRY(CIN_temp[2]));
    full_adder FA3(.A(A[3]), .B(B[3]), .CIN(CIN_temp[2]), .SUM(SUM[3]), .CARRY(CARRY));    
    
endmodule