module mB;
  bit [7:0] mem [0:3];
  int i, j, data;
  mailbox mbox; //declare a mailbox
  initial begin
    mbox = new (4); //create a bounded mailbox
      fork
  DMA_write;
  CPU_read; 
      join    
    end
 task DMA_write;             
   $display($stime,,, "DMA puts Mem Data into mbox");
   for (i=0; i < 4; i++) begin
        mem[i] = $urandom;
        $display($stime,,, "DMA WRITE[%0d] = %0d",i,mem[i]);
        mbox.put(mem[i]); //put data into the mailbox
      end
  endtask
  task CPU_read;
    $display($stime,,, "CPU retrieves Mem Data from mbox");
      for (j=0; j < 4; j++) begin
        mbox.get(data); //retrieve data from the mailbox
        $display($stime,,, "CPU READ[%0d] = %0d",i,data);
      end 
  endtask
endmodule