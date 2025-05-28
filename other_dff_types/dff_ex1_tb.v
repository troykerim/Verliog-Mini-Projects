`timescale 1ns / 1ps
module dff_ex1_tb;

    reg D;
    reg clk;
    reg sync_rst;
    wire Q;

    dff uut (
        .D(D),
        .clk(clk),
        .sync_rst(sync_rst),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    
    initial begin
        $monitor("TIME=%0t | CLK=%b RST=%b D=%b | Q=%b", $time, clk, sync_rst, D, Q);

        D = 0;
        sync_rst = 0;

        #10  sync_rst = 1;
        #10  sync_rst = 0;

        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 sync_rst = 1;
        #10 D = 1;
        #10 D = 0;
        #10 sync_rst = 0;
        #10 D = 1;
        #10 D = 1;
        #10 D = 0;
        #10 D = 0;
        #10 sync_rst = 1;
        #10 D = 1;
        #10 D = 0;
        #30 $finish;
    end

endmodule
