`timescale 1ns / 1ps
module demux1_2tb();
    reg sel, a;
    wire y0, y1; 
    demux UUT(.sel(sel), .a(a), .y0(y0), .y1(y1));
    
    initial begin
    $monitor("TIME=%0t | sel=%b a=%b y0=%b y1=%b", $time, sel, a, y0, y1);
    sel = 0; a = 0; #1;
    sel = 0; a = 1; #1;
    sel = 1; a = 0; #1;
    sel = 1; a = 1; #1;
    end

endmodule