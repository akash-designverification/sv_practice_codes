/* As opposed to “always_latch,” 
the “always_ff” must contain an event control – and one and only one event con
trol – else you will get a compile error. It cannot contain blocking timing controls. */

module alws;
       logic clk;
       logic q, d, reset;
         //always_ff begin //COMPILE ERROR
         //always_ff @(posedge clk or posedge reset) //OK
         always_ff @(posedge clk) begin
         //@(posedge reset); //COMPILE ERROR
         //#1 q <= d; //COMPILE ERROR
           q <= d;
         end
         always #10 clk = !clk;
         always @(posedge clk) d <= ~d;
         initial begin
           clk  = 0; d = 1;
           $monitor($stime,,,"clk = %d d = %d q = %d", clk, d, q);
           #60 $finish(2);
         end
       endmodule

/*Simulation log:
0 clk = 0 d = 1 q = x
10 clk = 1 d = 0 q = 1
20 clk = 0 d = 0 q = 1
30 clk = 1 d = 1 q = 0
40 clk = 0 d = 1 q = 0
*/