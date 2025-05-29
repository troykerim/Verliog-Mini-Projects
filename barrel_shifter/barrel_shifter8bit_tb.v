`timescale 1ns / 1ps
module barrel_shifter_tb();

    reg [7:0] DIN;
    reg [2:0] SEL;
    wire [7:0] DOUT;
    
    barrel_shifter_top UUT(.DIN(DIN), .SEL(SEL), .DOUT(DOUT));
    
    integer i, j;
    
    initial begin
        $monitor("TIME=%0t | DIN=%b, SEL=%b, DOUT=%b", $time, DIN, SEL, DOUT);
        
        // Test cases, more can be added, change the conditional
        for (i = 0; i < 3; i = i + 1) begin
            case(i)
                0: DIN = 8'b0000_1011;
                1: DIN = 8'b0101_0001;
                2: DIN = 8'b1111_1111;
                //3: DIN = 8'b1000_1001;
                //4: DIN = 8'b1001_1101;
            endcase

            // Test shift amounts from 0 to 8
            for (j = 0; j < 8; j = j + 1) begin
                SEL = j[2:0];
                #10;  
            end
        end

        #10;
        $finish;
    end
endmodule
