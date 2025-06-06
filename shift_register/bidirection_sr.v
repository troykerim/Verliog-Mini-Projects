/*
    Parameterized bidirectional shift register
    Using an enable
*/
`timescale 1ns / 1ps
module bidirectional_shift_reg  
#(parameter MSB=4) (  
    input d,                      // input for data to the first flop in the shift register
    input clk,                    // input for clock to all flops in the shift register
    input en,                     // input for enable to switch the shift register on/off
    input dir,                    // input to shift in either left or right direction
    input rstn,                   // input to reset the register to a default value
    output reg [MSB-1:0] out);    // output to read out the current value of all flops in this register


   // This always block will "always" be triggered on the rising edge of clock
   // Once it enters the block, it will first check to see if reset is 0 and if yes then reset register
   // If no, then check to see if the shift register is enabled
   // If no => maintain previous output. If yes, then shift based on the requested direction
   always @ (posedge clk)
      if (!rstn)
         out <= 0;
      else begin
         if (en)
            case (dir)
               0 :  out <= {out[MSB-2:0], d};
               1 :  out <= {d, out[MSB-1:1]};
            endcase
         else
            out <= out;
      end
endmodule
