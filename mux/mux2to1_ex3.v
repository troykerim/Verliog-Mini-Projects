/*
    2 x 1 Mux Behavioral Modeling
    
    A 2x1 Mux at this level needs an always block

*/
`timescale 1ns / 1ps
module mux2to1_ex3(
    input A,
    input B,
    input SEL,
    output reg OUT
    );
    always @(*) begin
        if (SEL)
            OUT = B;
        else
            OUT = A;
    end
endmodule