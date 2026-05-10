module OP;
  logic [7:0] data1;
  logic enb;
  initial begin
   enb = 1'b1;
   data1 = enb ? 'hff : 'z; //data1 = 'hff
   $display("enb = %0d data1 = %h", enb,data1);
   enb = 1'b0;
   data1 = enb ? 'hff : 'z; //data1 = 'z
   $display("enb = %0d data1 = %h", enb,data1);
   enb = 1'bx;
   //data1 = 'x. The two expressions are not equivalent
   data1 = enb ? 'hff : 'z;
   $display("enb = %0d data1 = %h", enb,data1);
   enb = 1'bx;
   data1 = enb ? 'hff : 'hff; //data1 = 'hff
                  //the two expressions are logically equivalent
   $display("enb = %0d data1 = %h", enb,data1);
   enb = 1'bx;
   data1 = enb ? 'hff : 'h00;
         //data1 = 'x. The two expressions are not equivalent
   $display("enb = %0d data1 = %h", enb,data1);
  end
endmodule

/* 
enb = 1'bx; data1 = enb ? 'hff : 'z;
//data1 = 'x; enb = 'x, so expression1 and expression2 are evalu
ated for logical equivalence. Since they are not equivalent, the 
result is 'x.