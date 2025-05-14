`timescale 1ns / 1ps

module full_adder_tb();

    reg A, B, CIN;
    wire SUM, CARRY;
    
    full_adder UUT(.A(A), .B(B), .CIN(CIN), .SUM(SUM), .CARRY(CARRY));
    
    initial begin
    $monitor("TIME= %t | A= %d, B= %d, CIN= %d, SUM= %d, CARRY= %d", $time, A, B, CIN, SUM, CARRY);
    
    A = 0; B = 0; CIN = 0;
    #10;
    
    A = 0; B = 0; CIN = 1;
    #10;
    
    A = 0; B = 1; CIN = 0;
    #10;
    
    A = 1; B = 0; CIN = 0;
    #10;
    
    A = 1; B = 1; CIN = 0;
    #10;
    
    A = 1; B = 0; CIN = 1;
    #10;
    
    A = 0; B = 1; CIN = 1;
    #10;
    
    A = 1; B = 1; CIN = 1;
    #10;
    
    $finish();
    end
endmodule
