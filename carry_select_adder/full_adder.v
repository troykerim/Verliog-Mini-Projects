`timescale 1ns / 1ps
module full_adder(
    input A,
    input B,
    input CIN,
    output SUM,
    output CARRY
    );
    
    wire S1, C1, C2; // Internal wires
    
    half_adder HA1(.A(A), .B(B), .SUM(S1), .CARRY(C1));
    half_adder HA2(.A(S1), .B(CIN), .SUM(SUM), .CARRY(C2));
    
    assign CARRY = C1 | C2;
    
endmodule