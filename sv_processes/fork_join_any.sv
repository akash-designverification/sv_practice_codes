/* when any of the parallel process finishes, you will 
jump out of the fork-join_any block. Other concurrent processes will continue to 
execute. In other words, the parent process blocks only until any of the processes 
spawned by the fork completes.
*/


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
           join_any
             $display($stime,,, "out of the loop");
           end
       endmodule
/*
Simulation log:
   40 d = 15
   40 out of the loop
   50 a = 5
   100 b = 10
   100 c = 20*/