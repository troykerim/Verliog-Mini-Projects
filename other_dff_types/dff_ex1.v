/*
    D flip flop
    Rising edge DFF with Synch Reset
    
    Synch reset means it will only be active at the rising or falling edge of the clock 
*/
`timescale 1ns / 1ps
module dff_ex1(
    input D,
    input clk,
    input sync_rst,
    output reg Q
    );
    always @(posedge clk) begin
        if(sync_rst == 1'b1)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule