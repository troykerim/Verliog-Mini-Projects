`timescale 1ns / 1ps
module piso_tb();
reg CLK, RST, LOAD;
    reg [3:0] DIN;
    wire DOUT;

    piso uut (
        .CLK(CLK),
        .RST(RST),
        .LOAD(LOAD),
        .DIN(DIN),
        .DOUT(DOUT)
    );

    initial CLK = 0;
    always #10 CLK = ~CLK;

    initial begin
        RST = 1; LOAD = 0; DIN = 4'b0000;
        #20 RST = 0;

        // Load 1011
        LOAD = 1; DIN = 4'b1011; #20;
        LOAD = 0;

        #80; // Allow 4 shifts

        // Load 1100
        LOAD = 1; DIN = 4'b1100; #20;
        LOAD = 0;

        #80;

        $finish;
    end

    initial begin
        $monitor("TIME=%0t | CLK=%b, RST=%b, LOAD=%b, DIN=%b, DOUT=%b", $time, CLK, RST, LOAD, DIN, DOUT);
    end

endmodule
