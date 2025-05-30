`timescale 1ns / 1ps
module encoder4x2_tb();
  reg en;
  reg [3:0]in;
  wire [1:0] out;
  
  // instantiate the model: creating 
  // instance for block diagram 
  encoder4x2 UUT(.en(en), .in(in), .out(out));
  initial begin
        $monitor("TIME=%0t | en=%b in=%b out=%b",$time, en, in, out);
        en = 0;
        in = 4'b0001; #10;
        en = 1;
        in = 4'b0001; #10;
        in = 4'b001x; #10;
        in = 4'b01xx; #10;
        in = 4'b1xxx; #10;
        en = 0;
        in = 4'b0001; #10;
        in = 4'b001x; #10;
        en = 1;
        in = 4'b001x; #10;

        $finish;
    end
endmodule