/*  
1.Logical implication ( -> )

Logically equivalent to (!expression1 || expression2)

2.Logical equivalence( <-> )

Logically equivalent to ((expression1 -> expression2) && (expression2 -> 
expression1))
------------------------------------------------------------------------------------------------
The way this works is whenever both “A1” and “A2” are non-zero numbers (i.e., 
true); both the logical implication and logical equivalence result will be true (1). 
Whenever both “A1” and “A2” are false, the logical equivalence will be true. 
Whenever either of “A1” or “A2” is a zero, the logical equivalence will be zero (0). 
That is because a true implies a true but a false does not imply a true.
---------------------------------------------------------------------------------------------------
*/

module OP;
  logic [15:0] A1, A2;
  int i1;
  initial begin
    A1 = 2; //Any number greater than 0
    A2 = 255; //Any number greater than 0
    i1 = A1 -> A2; //logical implication
    $display("A1 = %0d   A2 = %0d A1 -> A2 = %0d",A1,A2,i1);
    i1 = !A1 || A2; //equivalent to A1 -> A2
    $display("A1 = %0d   A2 = %0d !A1 || A2 = %0d",A1,A2,i1);
    i1 = A1 <-> A2;
    $display("A1 = %0d   A2 = %0d A1 <-> A2 = %0d",A1,A2,i1);
    $display("\n");
    A1 = 2;
    A2 = 0;
    i1 = A1 -> A2;
    $display("A1 = %0d   A2 = %0d A1 -> A2 = %0d",A1,A2,i1);
    i1 = A1 <-> A2;
    $display("A1 = %0d   A2 = %0d A1 <-> A2 = %0d",A1,A2,i1);
  end
endmodule

/* 
Simulation log:
A1 = 2 A2 = 255 A1 -> A2 = 1
A1 = 2 A2 = 255 !A1 || A2 = 1
A1 = 2 A2 = 255 A1 <-> A2 = 1
A1 = 2 A2 = 0 A1 -> A2 = 0
A1 = 2 A2 = 0 A1 <-> A2 = 0
*/