module mTask( );
         int data, address;
         task automatic PCI_read (inout int data, input int 
address);
           #10;
             address = address + 1; data = data + 1;
$display($stime,,,"\t address=%h data=%0d",address,data);
           #10;
             address = address + 1; data = data + 1;
$display($stime,,,"\t address=%h data=%0d",address,data);
           #10;
             address = address + 1; data = data + 1;
$display($stime,,,"\t address=%h data=%0d",address,data);
           #10;
             address = address + 1; data = data + 1;
$display($stime,,,"\t address=%h data=%0d",address,data);
         endtask
         initial begin
           address = 0; data = 9;
           #100 $finish(2);
         end
         always begin
           fork
             begin
               #20; $display($stime,,, "CALL PCI_read");
               PCI_read (data, address); //blocks till task is over
             end
             begin
               #1; $display($stime,,, "CALL PCI_read");
               PCI_read (data, address); //blocks till task is over
             end
           join
         end
endmodule

/*
Simulation log:
  1 CALL PCI_read
  11  address=00000001 data=10
  20 CALL PCI_read
  21  address=00000002 data=11
  30  address=00000001 data=10
  31  address=00000003 data=12
  40  address=00000002 data=11
  41  address=00000004 data=13
  50  address=00000003 data=12
  60  address=00000004 data=13
  61 CALL PCI_read
  71  address=00000001 data=14
  80 CALL PCI_read
  81  address=00000002 data=15
  90  address=00000001 data=14
  91  address=00000003 data=16 */