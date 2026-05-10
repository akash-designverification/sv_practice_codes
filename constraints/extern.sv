class c;
randc int data;

extern constraint ex1;// external constraint
constraint ex2; //internal constraint

endclass


constraint c::ex1{data<'hf;}
constraint c::ex2{data>'h9;}

module top;
c c1=new;

int i;

initial begin
  for(i=0;i<10;i++) begin
    c1.randomize();
    $display("the value of data %d :",c1.data);
  end
end
endmodule