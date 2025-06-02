`timescale 1ns / 1ps
module sipo_tb();

    reg DIN;
    reg CLK;
    reg RST;
    wire [3:0] DOUT; 

    sipo UUT (
        .DIN(DIN),
        .CLK(CLK),
        .RST(RST),
        .DOUT(DOUT)
    );
    initial CLK = 0;
    always #10 CLK = ~CLK;

    initial begin
        DIN = 0;
        RST = 1;

        // Reset for 1 cycle
        #20;
        RST = 0;

        // Shift in 1001 (LSB first into FF1)
        DIN = 1; #20;
        DIN = 0; #20;
        DIN = 0; #20;
        DIN = 1; #20;

        DIN = 0; #40;

        // Reset again
        RST = 1; #20;
        RST = 0;

        // Shift in 1011
        DIN = 1; #20;
        DIN = 0; #20;
        DIN = 1; #20;
        DIN = 1; #20;

        DIN = 0; #40;

        $finish;
    end
    initial begin
        $monitor("TIME=%0t | CLK=%b, RST=%b, DIN=%b, DOUT=%b", $time, CLK, RST, DIN, DOUT);
    end
endmodule