/*  The “wait” statement will evaluate a condi
tion, and if it is not true, it will block the procedural statements that follow that 
“wait” statement.*/

module level;
         int a, b, c, d;
         initial
           begin
             # 10; b = c * d;
             wait (a == 1);
             $display($stime,,, "wait complete");
           end
	initial begin

           c = 5; d = 10; a = 1;
         end
       endmodule
// wait complete