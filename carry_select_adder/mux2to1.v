`timescale 1ns / 1ps
module mux2to1(in0,in1,sel,out);
    parameter width=4; 
    input [width-1:0] in0,in1;
    input sel;
    output [width-1:0] out;
    
    assign out = (sel) ? in1 : in0;
endmodule