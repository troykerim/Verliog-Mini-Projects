/*
    4x2 Encoder with enable
    
    4 inputs (input bus), 1 enable, 2 bit output
*/

`timescale 1ns / 1ps
module encoder4x2(
    input en,
    input [3:0] in,
    output reg [1:0] out
    );
   always @(en,in)
     begin
       if(en)
         begin
            case(in)
                4'b0001: out = 2'b00;
                4'b001x: out = 2'b01;
                4'b01xx: out = 2'b10;
                4'b1xxx: out = 2'b11;
                default: out = 2'bxx;
            endcase
       end
    end
endmodule