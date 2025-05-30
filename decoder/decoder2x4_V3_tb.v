/*
    2x4 Decoder Test bench
    2 inputs with en
*/
`timescale 1ns / 1ps
module decoder_tb();
  reg en;
  reg a;
  reg b;
  wire [3:0] out;
  
  // instantiate the model: creating 
  // instance for block diagram 
  decoder UUT(.en(en), .a(a), .b(b), .out(out));
  initial begin
        $monitor("TIME=%0t | en=%b a=%b b=%b out=%b",$time, en, a, b, out);
        en = 0; a = 0; b = 0; #10;
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        en = 1; a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        en = 0; a = 1; b = 0; #10;
        $finish;
    end
endmodule