`timescale 1ns / 1ps
module piso (
    input CLK,
    input RST,
    input LOAD,
    input [3:0] DIN,
    output reg DOUT
);

    reg [3:0] shift_reg;

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            shift_reg <= 4'b0000;
            DOUT <= 1'b0;
        end
        else if (LOAD) begin
            shift_reg <= DIN;         // Load data into register
            DOUT <= DIN[3];           // Output MSB first
        end
        else begin
            shift_reg <= {shift_reg[2:0], 1'b0}; // Shift left (MSB first out)
            DOUT <= shift_reg[2];    // Next MSB becomes output
        end
    end

endmodule

