/*
    2x4 Decoder 
    Using always+case blocks
    2-bit input
    2 inputs with en
*/
`timescale 1ns / 1ps
module decoder(en,a,b,out);
   
   input en,a,b;
   output reg [3:0]out;
   // always is used in design block 
   // only in Behavioural modeling.
   always @(en,a,b)
     begin
       if(en==0)
         begin
           if(a==1'b0 & b==1'b0) out=4'b1110;
           else if(a==1'b0 & b==1'b1) out=4'b1101;
           else if(a==1'b1 & b==1'b0) out=4'b1011;
           else if(a==1 & b==1) out=4'b0111;
           else out=4'bxxxx;
         end
       else
        out=4'b1111;
     end
endmodule