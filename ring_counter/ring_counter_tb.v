`timescale 1ns / 1ps
module ring_counter_tb();
  parameter WIDTH = 4;

  reg clk;
  reg rstn;
  wire [WIDTH-1:0] out;

  ring_counter UUT(.clk (clk), .rstn (rstn), .out (out));

  always #10 clk = ~clk;

  initial begin
    {clk, rstn} <= 0;

    $monitor ("T=%0t | rstn=%b, out=%b", $time, rstn, out);
    repeat (2) @(posedge clk);
    rstn <= 1;
    repeat (10) @(posedge clk);
    $finish;
  end
endmodule