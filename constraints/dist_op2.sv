
// weight is distribute by given weight divided by no of elements in a  given range.

class c;
rand int data;

  constraint c { data dist{0:/40,1:/10,[2:5]:/20};}
endclass




module top;
c c1=new;

int i;

initial begin
  for(i=0;i<12;i++) begin
    c1.randomize();
    $display("the value of data %d :",c1.data);
  end
end
endmodule