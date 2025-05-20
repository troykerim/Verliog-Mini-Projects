`timescale 1ns / 1ps

module dff(
    input wire D,
    input wire CLK,
    input wire RST,   // Asynchronous active-high reset
    output reg Q
);

always @(posedge CLK or posedge RST) begin
    if (RST)
        Q <= 0;
    else
        Q <= D;
end

endmodule