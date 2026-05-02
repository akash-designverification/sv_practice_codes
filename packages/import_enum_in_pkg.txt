/*Note that importing an enumerated type definition does not import its enumerated labels. 
You have to explicitly import all the labels of the enumerated type (or use a wildcard import). 
For example,let us say you have the following package definition with an enum type.*/

	package enumP;
            typedef enum logic [1:0] {SLOW, FAST, MEDIUM} speed;
       endpackage

       module top;
       import enumP::speed;
       speed s1;
       always @(posedge clk)
       …
       s1 <= FAST; //ERROR
       …
       endmodule
/* enum name is copied but not labels.

In order to solve this problem, you have to explicitly import the enum labels. You 
have to do the following:
       import enumP::speed;
       import enumP::SLOW;
       import enumP::FAST;
       import enumP::MEDIUM;
Another way to solve the problem is to use a wildcard import:

       import enumP::*;
*/