//by default tasks are static except in class(automatic).
module mTask( );
         int data, address;
         task PCI_read (inout int data, input int address);//static task
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
1 CALL PCI_read
11  
address=00000001 data=10
20 CALL PCI_read
21  
address=00000001 data=10
30  
31  
40  
41  
50  
60  
61  
71  
address=00000002 data=11
address=00000003 data=12
address=00000004 data=13
address=00000005 data=14
address=00000006 data=15
address=00000007 data=16
CALL PCI_read
address=00000001 data=17
80 CALL PCI_read
81  
address=00000001 data=17
90  
91  
address=00000002 data=18
address=00000003 data=19 */