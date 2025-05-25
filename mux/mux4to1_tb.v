/*
    4 x 1 Mux Test Bench
*/
`timescale 1ns / 1ps
module mux_tb();


    reg A, B, C, D;
    reg [1:0] SEL;
    wire OUT;

    mux uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .SEL(SEL),
        .OUT(OUT)
    );

    initial begin
        $monitor("TIME=%0t | A=%d, B=%d, C=%d, D=%d, SEL=%d OUT=%d", $time, A, B, C, D, SEL, OUT);
        A = 0; B = 0; C = 0; D = 0; SEL = 2'b00;

        #10 A = 1; SEL = 2'b00;     
        #10 B = 1; SEL = 2'b01;     
        #10 C = 1; SEL = 2'b10;     
        #10 D = 1; SEL = 2'b11;     
        #10 A = 0; SEL = 2'b00;     
        #10 B = 0; SEL = 2'b01;     
        #10 C = 0; SEL = 2'b10;     
        #10 D = 0; SEL = 2'b11;     

        #10 $finish;
    end
endmodule