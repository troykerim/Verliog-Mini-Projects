`timescale 1ns / 1ps

module n_bit_full_adder_top #(parameter N = 32) (
    input  [N-1:0] A,
    input  [N-1:0] B,
    output [N-1:0] OUT
);
    wire [N-1:0] CARRY;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : generate_N_bit_Adder
            if (i == 0)
                half_adder ha (
                    .A(A[i]),
                    .B(B[i]),
                    .SUM(OUT[i]),
                    .CARRY(CARRY[i])
                );
            else
                full_adder fa (
                    .A(A[i]),
                    .B(B[i]),
                    .CIN(CARRY[i-1]),
                    .SUM(OUT[i]),
                    .CARRY(CARRY[i])
                );
        end
    endgenerate
endmodule