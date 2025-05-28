/*
    D flip flop
    Rising edge DFF with Asynch Reset 
    
    reset is active high
*/
`timescale 1ns / 1ps
module dff_ex2(
    input D,
    input clk,
    input async_rst,
    output reg Q
    );
    always @(posedge clk or posedge async_rst) begin
        if(async_rst == 1'b1)
            Q <= 1'b0;
        else
            Q <= D;
    end
    
endmodule