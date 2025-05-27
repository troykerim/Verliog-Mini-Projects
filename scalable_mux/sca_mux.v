/*
    Parameterized mux
    
    Set parameter to 1 by default then, In testbench make instances of the module 
    and specify the parameter value you want.  
*/
`timescale 1ns / 1ps
module sca_mux(A, B, SEL, OUT);
    parameter SIZE = 1;
    input [SIZE-1:0] A, B;
    input SEL;
    output [SIZE-1:0] OUT;
    
    assign OUT = SEL ? B : A;
endmodule
