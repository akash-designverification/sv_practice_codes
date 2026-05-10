/*    
-Statements in an “always_comb” will not include those that block, have blocking 
timing or event controls, or fork-join statements. In other words, the logic must 
be combinational.

- //#10; //ERROR – blocking statement not allowed.

-“always_comb” works off an implicit sensitivity list.

- This implicit sensitivity list is derived from the RHS variables of the expressions 
within the “always_comb” block.*/

 module alws;
         bit [3:0] a, b, d, e, g, h, z;
         byte  c, f;
         bit [7:0] m;
         bit clk;
         function bit [7:0] sub (bit [3:0] x, bit [3:0] z);
           sub = x - z;
           m = g * h;
         endfunction
         always_comb begin //sensitive to RHS variables
         //always @(a or b) //same as always_comb
           c = a + b;
	//#10; //ERROR – blocking timing statement not allowed.
           //@(z); //ERROR – Event control not allowed.
         end
         always_comb begin //sensitive to function inputs
                  //also sensitive to logic within the function
         //always @(d or e or g or h) //same as always_comb
           f = sub (d, e);
         end
	always #10 clk = !clk;

         always @(posedge clk) begin
           a = $urandom; b = $urandom; d = $urandom;
           e = $urandom; g = $urandom; h = $urandom;
         end
         initial begin
           clk  = 0;
           $monitor($stime,,, "a=%d b=%d c=%0d\td=%d e=%d f=%0d\t g=%d h=%d m=%d", a, b, c, d, e, f, g, h, m);
           #60 $finish(2);
         end
       endmodule

/* Simulation log:
0 a= 0 b= 0 c=0   
10 a= 4 b= 1 c=5  
30 a= 5 b= 2 c=7  
d= 0 e= 0 f=0  
d= 9 e= 3 f=6  
g= 0 h= 0 m= 0
g=13 h=13 m=169
d= 1 e=13 f=-12 g= 6 h=13 m= 78
50 a=13 b=12 c=25 d= 9 e= 6 f=3  
g= 5 h=10 m= 50
*/