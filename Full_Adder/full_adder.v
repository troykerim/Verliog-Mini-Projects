`timescale 1ns / 1ps

module full_adder(
    input A,
    input B,
    input CIN,
    output SUM,
    output CARRY
    );

    wire S1,C1,C2;

half_adder ha0(A,B,S1,C1);
half_adder ha1(CIN,S1,SUM,C2);

assign CARRY = C1 | C2 ;

endmodule