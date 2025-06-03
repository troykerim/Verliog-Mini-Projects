`timescale 1ns / 1ps
module clk_divider_tb();

    reg clk;
    reg rst;
    wire led;
 

    clk_divider uut (
        .clk(clk), 
        .rst(rst), 
        .led(led)
    );
 
    // Set clock frequency.
    always
        #5 clk = ~clk;
        // #10 clk = ~clk;
 
    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        #10 rst = 0;
        // Wait 100 ns for global reset to finish
        #100;
    end
endmodule
