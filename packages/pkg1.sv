// how to reference pkg's.
 
package p;
         typedef enum { FALSE, TRUE } bool;
       endpackage
       package q;
         typedef enum { ORIGINAL, FALSE } hair;
       endpackage
       module top1 ;
       import p::*;
       import q::hair;
         hair myhair;
         initial begin
           myhair = q:: FALSE; // OK:
           //myhair = FALSE;
           // ERROR: Direct reference to FALSE refers to the
           // FALSE enumeration literal imported from p
       end
       endmodule
module top2 ;
       import p::*;
       import q::hair, q::ORIGINAL, q::FALSE;
       //import q::*; //will not work.. need above import
         hair myhair;
         initial begin
           myhair = FALSE;
           // OK: Direct reference to FALSE refers to the
           // FALSE enumeration literal imported from q
         end
       endmodule