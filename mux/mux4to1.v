/*
    4 x 1 Mux Behaviorial level
    A 4x1 Mux at this level needs an always block and its recommended to use a case block

*/
`timescale 1ns / 1ps
module mux(
    input A,
    input B,
    input C,
    input D,
    input [1:0] SEL,
    output reg OUT
    );
    // Method 1: Case block (Recommended)
    always @(*) begin
    case(SEL)
            2'b00: OUT = A;
            2'b01: OUT = B;
            2'b10: OUT = C;
            2'b11: OUT = D;
        endcase
    end
    // Method 2: using if/else

    /*
        always @(*) begin
        if (SEL == 2'b00)
            OUT = A;
        else if (SEL == 2'b01)
            OUT = B;
        else if (SEL == 2'b10)
            OUT = C;
        else
            OUT = D;
    end */
endmodule