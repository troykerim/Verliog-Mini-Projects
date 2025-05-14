`timescale 1ns / 1ps

module half_adder(
    input a,
    input b,
    output sum,
    output carry
    );
    
assign carry = a & b;
assign sum = a ^ b;

endmodule
