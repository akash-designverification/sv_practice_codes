/*Let us see the same example, but here we import both “P1” and “P2” in module 
TRY1. Let us see if variable “a” is now visible in module TRY1.
Example 2:*/


       package P1;
         int  a = 1;
       endpackage : P1
       package P2;
         import P1 :: *;
         int  b = 2;
       endpackage : P2
       module TRY1( );
         import P1 :: *;
         import P2 :: *;
         initial begin
           $display("TRY1 : P1::a = %0d", a);
           $display("TRY1 : P2::b = %0d", b);
         end
       endmodule : TRY1

//a=1
//b=2