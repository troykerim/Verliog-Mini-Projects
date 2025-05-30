`timescale 1ns / 1ps
module decoder2x4_tb();
  reg [1:0] in;
  wire [3:0] out;

  decoder UUT(.in(in), .out(out));
  initial begin
        $monitor("TIME=%0t | in=%b out=%b",$time, in, out);
        in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;
        in = 2'b00; #10;
        in = 2'b10; #10;
        $finish;
    end
endmodule
