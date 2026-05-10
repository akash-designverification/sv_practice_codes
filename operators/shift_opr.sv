/*
There are two types of shift operators, logical shift (<< (shift left) and >> (shift 
right)) and arithmetic shift (<<< (left) and >>> (right)). The left shift operators (<< 
and <<<) shift their left operand to the left by the number of bits given by the right 
operand. The vacated bits are filled with zero. Similarly, the right shift operators (>> 
and >>>) will shift the left operand to the right by the number of bits given by the 
right operand, and the vacated bits are filled with zero. 

The arithmetic right shift fills the vacated bit positions with zeros if the result type is unsigned. 
It fills the vacated bit positions with the value of the most significant (i.e. sign) bit of the left 
operand if the result type is signed. 
If the right operand has an x or z value, then the result will be unknown. */

 module OP;
  logic [7:0] A1, i1;
  initial begin
    A1 = 8'b 10110111;
    i1 = A1 << 2; //left shift by 2
    $display("A1 = %b : << 2 = %b", A1,i1);
    i1 = A1 >> 4; //right shift by 4
    $display("A1 = %b : >> 4 = %b", A1, i1);
    A1= -3;
    i1 = A1 <<< 2; //arithmetic left shift by 2
                  //Note A1 is negative
    $display("A1 = %b : <<< 2 = %b", A1, i1);
    A1= -2;
    i1 = A1 >>> 4 ; //arithmetic right shift by 4
                   //Note A1 is negative
    $display("A1 = %b : >>> 4 = %b", A1, i1);
  end
endmodule