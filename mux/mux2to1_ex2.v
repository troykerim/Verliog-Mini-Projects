/*
    2 x 1 Mux Gate level Modeling
    
    A 2x1 Mux at this level always needs: 2 ANDs, 1 OR, 1 NOT

*/
`timescale 1ns / 1ps
module mux2to1_ex2(
    input A,
    input B,
    input SEL,
    output OUT
    );
    
    // Internal wires
    wire not_sel, and1, and2;

    not NOT (not_sel, SEL);
    and AND1 (and1, not_sel, A);
    and AND2 (and2, SEL, B);
    or  OR (OUT, and1, and2);

endmodule
