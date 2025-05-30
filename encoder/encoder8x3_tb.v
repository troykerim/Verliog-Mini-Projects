`timescale 1ns / 1ps
module encoder8x3_tb();
  reg en;
  reg [7:0]in;
  wire [2:0] out;
  
  // instantiate the model: creating 
  // instance for block diagram 
  encoder8x3 UUT(.en(en), .in(in), .out(out));
  initial begin
        $monitor("TIME=%0t | en=%b in=%b out=%b",$time, en, in, out);
        en = 0;
        in = 8'b00000001; #10;
        en = 1;
        in = 8'b00000001; #10;
        in = 8'b0000001x; #10;
        in = 8'b000001xx; #10;
        in = 8'b00001xxx; #10;
        in = 8'b0001xxxx; #10;
        in = 8'b001xxxxx; #10;
        in = 8'b01xxxxxx; #10;
        in = 8'b1xxxxxxx; #10;
        en = 0;
        in = 8'b00000001; #10;
        en = 1;
        in = 8'b00000001; #10;

        $finish;
    end
endmodule