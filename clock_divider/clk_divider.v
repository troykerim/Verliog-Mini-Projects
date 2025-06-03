/*
    Parameterized Clock Divider
    
    Original clock frequency is 100 MHz

    led is a possible output to be used on an FPGA later on
*/
`timescale 1ns / 1ps
module clk_divider #(parameter N=8)(
   input clk,
    input rst,
    output led
    );
 
wire [N-1:0] din;
wire [N-1:0] clkdiv;
 
dff dff_inst(
    .clk(clk),
    .rst(rst),
    .D(din[0]),
    .Q(clkdiv[0])
);
 
genvar i;
generate
for (i = 1; i < N; i=i+1) 
begin : dff_gen_label
    dff dff_inst (
        .clk(clkdiv[i-1]),
        .rst(rst),
        .D(din[i]),
        .Q(clkdiv[i])
    );
    end
endgenerate
 
assign din = ~clkdiv;
 
assign led = clkdiv[N-1];

endmodule