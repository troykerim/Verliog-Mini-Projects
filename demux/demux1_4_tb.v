`timescale 1ns / 1ps
module demux1_4_tb();
    reg [1:0] sel, a;
    wire y0, y1, y2, y3; 
    demux UUT(.sel(sel), .a(a), .y0(y0), .y1(y1), .y2(y2), .y3(y3));
    
    initial begin
    $monitor("TIME=%0t | sel=%b a=%b y0=%b y1=%b y2=%b y3=%b", $time, sel, a, y0, y1, y2, y3);
    sel = 2'b00; a = 0; #1;
    sel = 2'b00; a = 1; #1;
    sel = 2'b01; a = 0; #1;
    sel = 2'b01; a = 1; #1;
    
    sel = 2'b10; a = 0; #1;
    sel = 2'b10; a = 1; #1;
    sel = 2'b11; a = 0; #1;
    sel = 2'b11; a = 1; #1;
    $finish;
    end
endmodule