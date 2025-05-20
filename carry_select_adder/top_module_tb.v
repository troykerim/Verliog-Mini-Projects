`timescale 1ns / 1ps

module top_module_tb();
    reg [3:0] A,B;
    reg CIN;
    wire [3:0] SUM;
    wire CARRY;

    top_module uut(.A(A), .B(B), .CIN(CIN), .SUM(SUM), .CARRY(CARRY));

initial begin
    $monitor( "A=%d, B=%d, CIN= %d, SUM=%d, CARRY=%d", A, B, CIN, SUM, CARRY);
    A = 0; B = 0; CIN = 0; #10;
    A = 4'd0; B = 4'd0; CIN = 1'd1; #10;
    A = 4'd1; B = 4'd0; CIN = 1'b1; #10;
    A = 4'd1; B = 4'd2; CIN = 1'b1; #10;
    A = 4'd5; B = 4'd5; CIN = 1'b1; #10;
    A = 4'd9; B = 4'd7; CIN = 1'b0; #10;
    A = 4'd15; B = 4'd0; CIN = 1'b0; #10;
    A = 4'd15; B = 4'd1; CIN = 1'b0; #10;
    A = 4'd15; B = 4'd1; CIN = 1'b1; #10;
    $finish;
end

endmodule