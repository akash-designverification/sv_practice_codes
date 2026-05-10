module sema;
  bit [7:0] mem [0:3];
  int i, data;
  semaphore s1;
  initial begin
    s1 = new (1); //Create semaphore with 1 key
      fork
        DMA_write;
        CPU_read;
      join    
    end
  task DMA_write;         
    if (s1.try_get(1))  //non-blocking. Locks (gets)
      $display($stime,,, "DMA gets a KEY from semaphore");
    else
      wait (s1.try_get(1)); 
      //DMA writes data
      for (i=0; i < 4; i++) begin
        mem[i] = $urandom;
        $display($stime,,, "DMA WRITE[%0d] = %0d",i,mem[i]);
      end
      #5; //do something else
      s1.put(1); //DMA releases (puts) the key
    $display($stime,,, "DMA puts the KEY into semaphore");
  endtask
  task CPU_read;
    #0; s1.get (1); //WAIT to get the key - blocking
    $display($stime,,, "CPU gets the KEY from semaphore");
      //CPU reads data
      for (i=0; i < 4; i++) begin
        data = mem[i];
        $display($stime,,, "CPU READ[%0d] = %0d",i,data);
      end
endtask
endmodule


/*
Simulation log:
0 DMA gets a KEY from semaphore
0 DMA WRITE[0] = 36
0 DMA WRITE[1] = 129
0 DMA WRITE[2] = 9
0 DMA WRITE[3] = 99
5 DMA puts the KEY into semaphore
5 CPU gets the KEY from semaphore
5 CPU READ[0] = 36
5 CPU READ[1] = 129
5 CPU READ[2] = 9
5 CPU READ[3] = 99 */