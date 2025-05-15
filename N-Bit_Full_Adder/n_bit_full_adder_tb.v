`timescale 1ns / 1ps

module n_bit_full_adder_tb();
    reg [31:0] A;
    reg [31:0] B;
    wire [31:0] OUT;

    n_bit_full_adder_top #(32) uut (
        .A(A),
        .B(B),
        .OUT(OUT)
    );

    initial begin
        $monitor("TIME=%0t | A=%d, B=%d, OUT=%d", $time, A, B, OUT);
        
        A = 32'd1209; B = 32'd4565; #10;
        A = 32'd100;  B = 32'd200;  #10;
        A = 32'd1; B=32'd1; #10;
        A = 32'd5000; B=32'd5000; #10;
        
        // For 32 bit
        A = 32'd1_000_000_000; B = 32'd2_000_000_000; #10;
        A = 32'd2_147_483_647; B = 32'd1_000_000_000; #10;
        A = 32'd3_000_000_000; B = 32'd1_294_967_295; #10;
        A = 32'd500_000_000;   B = 32'd3_500_000_000; #10;
        A = 32'd4294967295; B = 32'd1; #10; // Overflow test
        A = 32'd17; B=32'd3; #10;
        A = 0; B = 0; #10;

        $finish;
    end
endmodule
