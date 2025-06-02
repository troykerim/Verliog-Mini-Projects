`timescale 1ns / 1ps
module dff(
    input D,
    input CLK,
    input RST,
    output reg Q
    );
always @(posedge CLK or posedge RST) begin
    if (RST)
        Q <= 0;
    else
        Q <= D;
end

endmodule
