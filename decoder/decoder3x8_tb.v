/*
    2x4 Decoder Test bench
    2 inputs with en
*/
`timescale 1ns / 1ps
module decoder_tb();
  reg en;
  reg a;
  reg b;
  reg c;
  wire [7:0] out;
  
  // instantiate the model: creating 
  // instance for block diagram 
  decoder_top UUT(.en(en), .a(a), .b(b), .c(c), .out(out));
  initial begin
        $monitor("TIME=%0t | en=%b a=%b b=%b c=%b out=%b",$time, en, a, b, c, out);
        en = 0; a = 0; b = 0; c = 0; #10;
        
        en = 1; 
        a = 0; b = 0; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        
        a = 1; b = 0; c = 0; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 1; b = 1; c = 1; #10;

        en = 0; a = 0; b = 0; #10;
        a = 0; b = 1; c = 0; #10;

        en = 1; a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 1; #10;
        a = 1; b = 0; c = 0; #10;
        $finish;
    end
endmodule