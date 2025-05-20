`timescale 1ns / 1ps

// N-bit RCA 
module ripple_carry_adder(A,B,CIN,SUM,CARRY);
    input [3:0] A;
    input [3:0] B;
    input CIN;
    output [3:0] SUM;
    output CARRY;
    
    //Internal Carrys 
    wire C1,C2,C3;
    
    // Instantiate 4 FAs
    full_adder fa0(
        .A(A[0]),
        .B(B[0]),
        .CIN(CIN),
        .SUM(SUM[0]),
        .CARRY(C1));
        
    full_adder fa1(
        .A(A[1]),
        .B(B[1]),
        .CIN(C1),
        .SUM(SUM[1]),
        .CARRY(C2));
        
    full_adder fa2(
        .A(A[3]),
        .B(B[2]),
        .CIN(C2),
        .SUM(SUM[2]),
        .CARRY(C3));

    full_adder fa3(
        .A(A[3]),
        .B(B[3]),
        .CIN(C3),
        .SUM(SUM[3]),
        .CARRY(CARRY));
  
endmodule
