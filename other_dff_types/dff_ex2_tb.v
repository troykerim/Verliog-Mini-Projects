`timescale 1ns / 1ps
module dff_ex2_tb;
    reg D;
    reg clk;
    reg async_rst;
    wire Q;

    dff uut (
        .D(D),
        .clk(clk),
        .async_rst(async_rst),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        $monitor("TIME=%0t | CLK=%b RST=%b D=%b | Q=%b", $time, clk, async_rst, D, Q);

        D = 0;
        async_rst = 0;

        #5   async_rst = 1;  
        #5   async_rst = 0;

        #10  D = 1;
        #10  D = 0;
        #10  D = 1;
        #10  D = 1;
        #10  D = 0;
        #10  D = 1;

        #5   async_rst = 1;  
        #5   async_rst = 0;

        #10  D = 1;
        #10  D = 0;
        #10  D = 1;
        #10  D = 1;
        #10  D = 0;
        #10  D = 0;

        #5   async_rst = 1;  
        #5   async_rst = 0;

        #10  D = 1;
        #20  D = 0;

        #30 $finish;
    end

endmodule

