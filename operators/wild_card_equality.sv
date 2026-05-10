/* The wildcard equality operator (==?) and inequality operator (!=?) treat X and Z 
values in a given bit position of their right operand as a wildcard. 
X and Z values in the left operand are not treated as wildcards. 
A wildcard bit matches any bit value (0, 1, Z, or X) in 
the corresponding bit of the left operand being compared against it */




module OP;
  logic [15:0] A1, A2;
  initial begin
    A1='hff; A2='hxx;
    $display("A1='hff  A2='hxx : A1==? A2 = boolean %0d",
             A1==? A2);
    $display("A1='hff  A2='hxx : A1!=? A2 = boolean %0d",
             A1!=? A2);
    A1='hxx; A2='hff;
    $display("A1='hxx  A2='hff : A1==? A2 = boolean %0d",
             A1==? A2);
    $display("A1='hxx  A2='hff : A1!=? A2 = boolean %0d",
             A1!=? A2);
  end
endmodule


/* A1='hff A2='hxx : A1==? A2 = boolean 1
A1='hff A2='hxx : A1!=? A2 = boolean 0
A1='hxx A2='hff : A1==? A2 = boolean x
A1='hxx A2='hff : A1!=? A2 = boolean x */