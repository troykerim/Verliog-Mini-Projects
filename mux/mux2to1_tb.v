/*
    2 x 1 Mux Test Bench
*/
`timescale 1ns / 1ps
module mux_tb();
    reg A, B, SEL;
    wire OUT;
    
    mux UUT(.A(A), .B(B), .SEL(SEL), .OUT(OUT));
    
    initial begin
        $monitor("TIME=%0t | A=%d, B=%d, SEL=%d OUT=%d", $time, A, B, SEL, OUT);
        A = 0; B = 0; SEL = 0; #1;
        A = 0; B = 1; SEL = 1; #1;
        A = 1; B = 0; SEL = 0; #1;
        A = 1; B = 0; SEL = 0; #1;
        A = 0; B = 1; SEL = 1; #1;
        $finish;
    end 
endmodule
