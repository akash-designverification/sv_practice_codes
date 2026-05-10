/* These operators perform a bitwise operation on a single operand to produce a sin
gle bit result. The operation will first apply between the first bit of the operand and 
the second bit of the operand. It will then take the result of this operation and apply 
to the third bit. And so on.*/


module OP;
  logic [7:0] A1;
  int i1;
  initial begin
    A1 = 8'b 10110111;
    i1 = & i1;
    $display("A1 = 10110111 : & i1 = %0d", i1);
    i1 = | i1;
    $display("A1 = 10110111 : | i1 = %0d", i1);
    i1 = ^ i1;
    $display("A1 = 10110111 : ^ i1 = %0d", i1);
    i1 = ~& i1;
    $display("A1 = 10110111 : ~& i1 = %0d", i1);
    i1 = ~| i1;
    $display("A1 = 10110111 : ~| i1 = %0d", i1);
    i1 = ~^ i1;
    $display("A1 = 10110111 : ~^ i1 = %0d", i1);
  end
endmodule

