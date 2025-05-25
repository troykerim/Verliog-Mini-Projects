/*
    2 x 1 Mux Dataflow Modeling
    No procedural block (always)

*/
`timescale 1ns / 1ps
module mux2to1_ex1(
    input A,
    input B,
    input SEL,
    output OUT
    );
    
    assign OUT = SEL ? B : A;
endmodule