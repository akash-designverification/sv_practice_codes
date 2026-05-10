

module alws;
       logic clk;
       logic q, d, a, c;
         always_latch begin
           q <= d;
//#10;  //ERROR
         end
         always #10 clk = !clk;
         always @(posedge clk) d <= ~d;
         initial begin
           clk  = 0; d = 1;
           $monitor($stime,,,"clk = %d d = %d q = %d",clk,d,q);
           #60 $finish(2);
         end
       endmodule
/*
Simulation log:
   0 clk = 0 d = 1 q = 1
   10 clk = 1 d = 0 q = 0
   20 clk = 0 d = 0 q = 0
   30 clk = 1 d = 1 q = 1
   40 clk = 0 d = 1 q = 1
   50 clk = 1 d = 0 q = 0 */