`timescale 1ns / 1ps

module carry_look_ahead_tb();
  reg [3:0]A, B; 
  reg CIN;
  wire [3:0] SUM;
  wire COUT;
  wire[4:0] add;
  
  carry_look_ahead UUT(A, B, CIN, SUM, COUT);
  
  assign add = {COUT, SUM};
  initial begin
    $monitor("A = %b: B = %b, Cin = %b --> S = %b, Cout = %b, Addition = %0d", A, B, CIN, SUM, COUT, add);
    A = 0; B = 0; CIN = 0; #3;
    A = 1; B = 0; CIN = 0; #3;
    A = 2; B = 4; CIN = 1; #3;
    A = 4'hb; B = 4'h6; CIN = 0; #3;
    A = 5; B = 3; CIN = 1; #3;
    A = 5; B = 3; CIN = 0; #3;
    A = 10; B=1; CIN=0; #3;
    A = 10; B=10; CIN=1; #3;
    $finish;
  end
endmodule