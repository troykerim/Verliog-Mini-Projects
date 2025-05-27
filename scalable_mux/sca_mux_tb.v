`timescale 1ns / 1ps
module sca_mux_tb();
    reg [5:0] A;
    reg [5:0] B;
    reg SEL;
    wire OUT1;
    wire [3:0]OUT4;
    wire [4:0]OUT5;
    wire [5:0]OUT6;
    
    sca_mux m1(.A(A), .B(B), .SEL(SEL), .OUT(OUT1));
    sca_mux #(4) m4(.A(A), .B(B), .SEL(SEL), .OUT(OUT4));
    sca_mux #(.SIZE(5)) m5(.A(A), .B(B), .SEL(SEL), .OUT(OUT5));
    sca_mux m6(.A(A), .B(B), .SEL(SEL), .OUT(OUT6));
    defparam m6.SIZE = 6;
    
    initial begin
    $monitor("TIME=%0t | A=%b, B=%b, SEL=%b, | OUT1=%b, OUT4=%b, OUT5=%b, OUT6=%b", $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
    A <= 6'b100_100;
    B <= 6'b110_011;
    SEL <= 1'b0;
    #20;
    
    A <= 6'b101_100;
    B <= 6'b110_111;
    SEL <= 1'b0;
    #20;  
    
    A <= 6'b100_100;
    B <= 6'b110_011;
    SEL <= 1'b1;
    #20;   
    
    A <= 6'b101_100;
    B <= 6'b110_111;
    SEL <= 1'b1;
    #20; 
    
    A <= 6'b010_111;
    B <= 6'b101_001;
    SEL <= 1'b0;
    #20; 
    
    A <= 6'b011_001;
    B <= 6'b011_001;
    SEL <= 1'b0;
    #20;  
    
    A <= 6'b010_111;
    B <= 6'b101_001;
    SEL <= 1'b1;
    #20;   
    
    A <= 6'b010_001;
    B <= 6'b010_001;
    SEL <= 1'b1;
    #20;
    
    A <= 6'b011_001;
    B <= 6'b011_001;
    SEL <= 1'bx;
    #20;
    
    A <= 6'b011_001;
    B <= 6'b100_110;
    SEL <= 1'bx;
    #20;
    
    A <= 6'b011_001;
    B <= 6'b111_000;
    SEL <= 1'bx;
    #20;
    $finish;
    end

endmodule
