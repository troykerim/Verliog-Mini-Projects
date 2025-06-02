`timescale 1ns / 1ps
module pipo_tb();

    reg CLK, RST;
    reg [3:0] DIN;
    wire [3:0] DOUT;

    pipo uut (
        .CLK(CLK),
        .RST(RST),
        .DIN(DIN),
        .DOUT(DOUT)
    );

    initial CLK = 0;
    always #10 CLK = ~CLK;

    initial begin
        RST = 1; DIN = 4'b0000; #20;
        RST = 0;

        DIN = 4'b1011; #20;
        DIN = 4'b1100; #20;
        DIN = 4'b0110; #20;
        DIN = 4'b0001; #20;

        $finish;
    end

    initial begin
        $monitor("TIME=%0t | CLK=%b, RST=%b, DIN=%b, DOUT=%b", $time, CLK, RST, DIN, DOUT);
    end
endmodule