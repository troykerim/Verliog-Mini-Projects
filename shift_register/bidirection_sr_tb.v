`timescale 1ns / 1ps

module shift_reg_tb();
   parameter MSB = 8;        // Optional, Declare a parameter to represent number of bits in shift register.  This case 8 bits

   reg data;                  
   reg clk;                   
   reg en;                    
   reg dir;                  
   reg rstn;                  
   wire [MSB-1:0] out;        

   
   bidirectional_shift_reg  #(MSB) sr0  (  .d (data),
                             .clk (clk),
                             .en (en),
                             .dir (dir),
                             .rstn (rstn),
                             .out (out));

   // Generate clock time period = 20ns, freq => 50MHz
   always #10 clk = ~clk;

   // default values at time 0
   initial begin
      clk <= 0;
      en <= 0;
      dir <= 0;
      rstn <= 0;
      data <= 'h1;
   end

   initial begin
      // Apply reset and deassert reset after some time
      rstn <= 0;
      #20 rstn <= 1;
          en <= 1;

	  // For 7 clocks, drive alternate values to data pin
      repeat (7) @ (posedge clk)
         data <= ~data;

     // Change direction and drive alternate value to data pin for another 7 clocks
      #10 dir <= 1;
      repeat (7) @ (posedge clk)
         data <= ~data;

      // Drive nothing for next 7 clocks, allow shift register to simply shift based on dir
      repeat (7) @ (posedge clk);

 
      $finish;
   end

   initial
      $monitor ("rstn=%0b data=%b, en=%0b, dir=%0b, out=%b", rstn, data, en, dir, out);
endmodule
