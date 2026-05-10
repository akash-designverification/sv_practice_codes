/* 
each statement executes as a concurrent process. The timing control 
does not have to be ordered sequentially wrt time.
In this block, the parent process blocks until all the processes spawned by the “fork” competes. */

module forkJoin;
         int a, b, c, d;
         initial
           fork : forkBlock
             begin //first process
               #50 a = 5;
               $display($stime,,, "a = %0d",a);
             end
             begin //second process
               #100 b = 10;
               $display($stime,,, "b = %0d",b);
             end
             begin //third process
               #100 c = 20;
               $display($stime,,, "c = %0d",c);
             end
             begin //fourth process
               #50 d = 15;
               $display($stime,,, "d = %0d",d);
             end
	//first, second, third and fourth processes execute in parallel.
           join
       endmodule
/*Simulation log:
50 a = 5
50 d = 15
100 b = 10
100 c = 20*/