module mTask( );
717
22.1  Tasks
       logic iReady;
       int data, address;
       task PCI_read (inout int data, output int address);
         @(posedge iReady); //edge sensitive time control
           $display($stime,,,"\t In task - posedge iReady");
         address = $urandom; data = $urandom;
           $display($stime,,,"\t address=%h data=%h", address, data);
         @(negedge iReady); //edge sensitive time control
           $display($stime,,,"\t In task - negedge iReady");
         address = $urandom; data = $urandom;
           $display($stime,,,"\t address=%h data=%h", address, data);
       endtask
       initial begin
         iReady = 0;
         #100 $finish(2);
       end
       always begin
         #20; $display($stime,,, "CALL PCI_read");
         PCI_read (data, address); //blocks till task is over
       end
       always begin
         #10; iReady = ! iReady;
       end
     endmodule
/*Simulation log:
20 CALL PCI_read
30  
In task - posedge iReady
30  
40  
address=12153524 data=c0895e81
In task - negedge iReady
40  address=8484d609 data=b1f05663
  60 CALL PCI_read
  70  In task - posedge iReady
  70  address=06b97b0d data=46df998d
  80  In task - negedge iReady
  80  address=b2c28465 data=89375212*/