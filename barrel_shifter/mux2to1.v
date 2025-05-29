`timescale 1ns / 1ps
module mux2to1(
    input A, B, SEL,
    output reg OUT
    );
    always @(*) begin
    if(SEL)
        OUT <= A;
    else
        OUT <= B;
    end 
endmodule