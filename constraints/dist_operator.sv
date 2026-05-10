// weight distribution is same for all the values in the range.
class c;
rand int data;

  constraint c { data dist{[0:2]:=40,[3:5]:=10,[6:10]:=20};}
endclass




module top;
c c1=new;

int i;

initial begin
  for(i=0;i<20;i++) begin
    c1.randomize();
    $display("the value of data %d :",c1.data);
  end
end
endmodule