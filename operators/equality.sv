/* Case equality version compares with “x” and “z,” 
while the logical equality operators will result in an “x” when compared with “x” or 
“z.” */


module OP;
  logic [15:0] A1, A2;
  initial begin
    $display("\n NO 'x' in data");
    A1='hff; A2='hf0;
    $display("A1='hff  A2='hf0 : A1 == A2= boolean %0d",A1== A2);
    $display("A1='hff  A2='hf0 : A1 != A2= boolean %0d",A1!= A2);
    $display("A1='hff  A2='hf0 : A1 === A2= boolean %0d",A1=== A2);
    $display("A1='hff  A2='hf0 : A1 !== A2= boolean %0d",A1!== A2);
    $display("\n WITH 'x' in data");
    A1='hxf; A2='hxf;
    $display("A1='hxf  A2='hxf : A1 == A2= boolean %0d",A1== A2);
    $display("A1='hxf  A2='hxf : A1 != A2= boolean %0d",A1!= A2);
    $display("A1='hxf  A2='hxf : A1 === A2= boolean %0d",
              A1 === A2);
    $display("A1='hxf  A2='hxf : A1 !== A2= boolean %0d", A1!== A2);
  end
endmodule


/*
NO 'x' in data
A1='hff A2='hf0 : A1 == A2= boolean 0
A1='hff A2='hf0 : A1 != A2= boolean 1
A1='hff A2='hf0 : A1 === A2= boolean 0
A1='hff A2='hf0 : A1 !== A2= boolean 1
WITH 'x' in data
A1='hxf A2='hxf : A1 == A2= boolean x
A1='hxf A2='hxf : A1 != A2= boolean x
A1='hxf A2='hxf : A1 === A2= boolean 1
A1='hxf A2='hxf : A1 !== A2= boolean 0

*/