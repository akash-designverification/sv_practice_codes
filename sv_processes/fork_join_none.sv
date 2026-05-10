/* control jumps out of the fork block even when none of the processes have completed. 
Useful in cases, when you want to fork off multiple parallel processes
but do not want to wait for any of them to complete.

       module forkJoin;
         int a, b, c, d;
         initial
           begin
           fork : forkBlock
             begin //first process
               #50 a = 5;
               $display($stime,,,"a = %0d",a);
             end
             begin //second process
               #100 b = 10;
               $display($stime,,,"b = %0d",b);
             end
             begin //third process
               #100 c = 20;
               $display($stime,,,"c = %0d",c);
             end
             begin //fourth process
               #40 d = 15;
               $display($stime,,,"d = %0d",d);
             end
           join_none
             $display($stime,,, "out of the loop");
	end
       endmodule


/*  Simulation log:
0 out of the loop
40 d = 15
50 a = 5
100 b = 10
100 c = 20  */