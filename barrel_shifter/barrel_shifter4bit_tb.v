/*
    4-bit Barrel Shifter Test Bench
*/
`timescale 1ns / 1ps
module barrel_shifter4bit_tb();
    reg [3:0] DIN;
    reg [1:0] SEL;
    wire [3:0] DOUT;
    
    barrel_shifter_top UUT(.DIN(DIN), .SEL(SEL), .DOUT(DOUT));
    
    integer i, j;
    
    initial begin
        $monitor("TIME=%0t | DIN=%b, SEL=%b, DOUT=%b", $time, DIN, SEL, DOUT);
        
        // Test cases, more can be added, change the conditional
        for (i = 0; i < 5; i = i + 1) begin
            case(i)
                0: DIN = 4'b1011;
                1: DIN = 4'b0101;
                2: DIN = 4'b1111;
                3: DIN = 4'b1000;
                4: DIN = 4'b1001;
            endcase

            // Test shift amounts from 0 to 3
            for (j = 0; j < 4; j = j + 1) begin
                SEL = j[1:0];
                #10;  
            end
        end

        #10;
        $finish;
    end
endmodule
