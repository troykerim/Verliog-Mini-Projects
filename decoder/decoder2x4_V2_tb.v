/*
    2x4 Decoder Test bench
    2 inputs 
*/
`timescale 1ns / 1ps
module decoder_tb();
  reg a;
  reg b;
  wire [3:0] out;
  
  // instantiate the model: creating 
  // instance for block diagram 
  decoder UUT(.a(a), .b(b), .out(out));
  initial begin
        $monitor("TIME=%0t | a=%b b=%b out=%b",$time, a, b, out);
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
    end
endmodule