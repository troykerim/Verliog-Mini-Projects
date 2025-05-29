/*
    8-bit barrel shifter (Shifting left)
    3 Stages of Muxes
    8 muxes per stage
*/

`timescale 1ns / 1ps
`timescale 1ns / 1ps

module barrel_shifter_top(
    input  [7:0] DIN,
    input  [2:0] SEL,
    output [7:0] DOUT
);

    wire [7:0] stage1_out; // Output of Stage 1, Input to Stage 2
    wire [7:0] stage2_out; // Output of Stage 2, Input to Stage 3

    // Stage 1: shift by 1 
    assign stage1_out[7] = SEL[0] ? DIN[6] : DIN[7];
    assign stage1_out[6] = SEL[0] ? DIN[5] : DIN[6];
    assign stage1_out[5] = SEL[0] ? DIN[4] : DIN[5];
    assign stage1_out[4] = SEL[0] ? DIN[3] : DIN[4];
    assign stage1_out[3] = SEL[0] ? DIN[2] : DIN[3];
    assign stage1_out[2] = SEL[0] ? DIN[1] : DIN[2];
    assign stage1_out[1] = SEL[0] ? DIN[0] : DIN[1];
    assign stage1_out[0] = SEL[0] ? 1'b0   : DIN[0];  

    // Stage 2: shift by 2 
    assign stage2_out[7] = SEL[1] ? stage1_out[5] : stage1_out[7];
    assign stage2_out[6] = SEL[1] ? stage1_out[4] : stage1_out[6];
    assign stage2_out[5] = SEL[1] ? stage1_out[3] : stage1_out[5];
    assign stage2_out[4] = SEL[1] ? stage1_out[2] : stage1_out[4];
    assign stage2_out[3] = SEL[1] ? stage1_out[1] : stage1_out[3];
    assign stage2_out[2] = SEL[1] ? stage1_out[0] : stage1_out[2];
    assign stage2_out[1] = SEL[1] ? 1'b0          : stage1_out[1];
    assign stage2_out[0] = SEL[1] ? 1'b0          : stage1_out[0];

    // Stage 3: shift by 4 
    assign DOUT[7] = SEL[2] ? stage2_out[3] : stage2_out[7];
    assign DOUT[6] = SEL[2] ? stage2_out[2] : stage2_out[6];
    assign DOUT[5] = SEL[2] ? stage2_out[1] : stage2_out[5];
    assign DOUT[4] = SEL[2] ? stage2_out[0] : stage2_out[4];
    assign DOUT[3] = SEL[2] ? 1'b0          : stage2_out[3];
    assign DOUT[2] = SEL[2] ? 1'b0          : stage2_out[2];
    assign DOUT[1] = SEL[2] ? 1'b0          : stage2_out[1];
    assign DOUT[0] = SEL[2] ? 1'b0          : stage2_out[0];

endmodule


