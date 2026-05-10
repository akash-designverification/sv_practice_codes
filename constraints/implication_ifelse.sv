class dataP;
  rand bit [7:0] data;
  string    burst_mode ;
  constraint burst1 { (burst_mode == "short") -> (data < 16);}
                                             //implication
  constraint burstIf { if (burst_mode == "long") data > 16;
                  else if (burst_mode == "garbage") data == 0;}
endclass
module top;
  initial begin
    dataP d1;
    d1 = new();
    d1.burst_mode = "short";
    repeat(4) begin
      d1.randomize();
$display("\t Short burst_mode = %s data = %0d",d1.burst_
mode,d1.data);
    end
    $display("\n");
    d1.burst_mode = "long";
    repeat(4) begin
      d1.randomize();
$display("\t Long burst_mode = %s data = %0d",d1.burst_
mode,d1.data);
    end
 $display("\n");
    d1.burst_mode = "garbage";
    repeat(4) begin
      d1.randomize();
$display("\t garbage burst_mode = %s data = %0d",d1.burst_mode,d1.data);
    end
  end
endmodule

/* Short burst_mode = short data = 13
Short burst_mode = short data = 6
Short burst_mode = short data = 1
Short burst_mode = short data = 2
Long burst_mode = long data = 36
Long burst_mode = long data = 109
Long burst_mode = long data = 18
Long burst_mode = long data = 47
garbage burst_mode = garbage data = 0
garbage burst_mode = garbage data = 0
garbage burst_mode = garbage data = 0
garbage burst_mode = garbage data = 0 */