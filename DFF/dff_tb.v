`timescale 1ns / 1ps

module dff_tb();

    reg D;
    reg CLK;
    reg RST;
    wire Q;

    // Instantiate the DFF
    dff uut (
        .D(D),
        .CLK(CLK),
        .RST(RST),
        .Q(Q)
    );

    // Clock generation. 20 ns period
    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;
    end

    
    initial begin
        $monitor("TIME=%0t | CLK=%b RST=%b D=%b | Q=%b", $time, CLK, RST, D, Q);

        // Initial values
        RST = 1; D = 0;
        #25;     

        RST = 0; D = 1;  
        #20;

        D = 0;           

        D = 1;
        #20;
        // Reset again
        RST = 1;         
        #10;

        RST = 0; D = 0;  
        #20;

        $finish;
    end

endmodule


