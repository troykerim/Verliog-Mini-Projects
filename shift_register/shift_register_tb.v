`timescale 1ns / 1ps
module shift_register_tb;

    reg DIN;
    reg CLK;
    reg RST;
    wire DOUT;

    shift_register UUT (
        .DIN(DIN),
        .CLK(CLK),
        .RST(RST),
        .DOUT(DOUT)
    );

    // Clock generation
    initial CLK = 0;
    always #10 CLK = ~CLK;

    initial begin
        // Initialize all signals
        DIN = 0;
        RST = 1;

        // Hold reset 
        #20;  
        RST = 0;


        // First pattern: 1 0 0 1
        DIN = 1; #20;   // time: 60 ns
        DIN = 0; #20;   // time: 80 ns
        DIN = 0; #20;   // time: 100 ns
        DIN = 1; #20;   // time: 120 ns

        DIN = 0;  
        #80;      // 4 clock cycles


        // Reset and new pattern: 1 0 1 1
        RST = 1; #20;
        RST = 0;

        DIN = 1; #20;
        DIN = 0; #20;
        DIN = 1; #20;
        DIN = 1; #20;

        DIN = 0;
        #40;  // Observe shifting again

        $finish;
    end

    // Monitor output
    initial begin
        $monitor("TIME=%0t | CLK=%b, RST=%b, DIN=%b, DOUT=%b", $time, CLK, RST, DIN, DOUT);
    end

endmodule
