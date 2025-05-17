`timescale 1ns / 1ps

module ripple_carry_adder_tb();
    reg [3:0]A;
    reg [3:0]B;
    reg CIN;
    wire [3:0]SUM;
    wire CARRY;
    
    integer i, j;
    ripple_carry_adder UUT(.A(A), .B(B), .CIN(CIN), .SUM(SUM), .CARRY(CARRY));
    initial begin
        CIN = 1'b0;
        $monitor("TIME=%0t | A=%d, B=%d, CIN=%d SUM=%d CARRY=%d", $time, A, B, CIN, SUM, CARRY);
        for(i = 0; i<=15; i=i+1) begin
            for(j = 0; j<=15; j=j+1) begin
                A =i;
                B = j;
                #1; 
            end
        end
        
    end
    initial begin
    #350 $finish;
    end 

endmodule