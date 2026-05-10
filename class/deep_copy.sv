module class_TOP( );
       class PCIChild;
         logic [7:0] burstC;
         function new (logic [7:0] burst);
             burstC = burst;
         endfunction
       endclass : PCIChild

       class PCITop;
         logic [31:0] addrTop;
         logic [31:0] dataTop;
         PCIChild PCIc;

         function new(logic [31:0] addr, logic [31:0] data, logic [7:0] burst);
            PCIc = new(burst); //instantiate PCIc
            addrTop = addr;
            dataTop = data;
         endfunction

         function void copy (PCITop p);
             addrTop = p.addrTop;
             dataTop = p.dataTop;
             PCIc.burstC = p.PCIc.burstC;
          endfunction

         function void disp (string instName);
           $display("[%s] addr = %h data = %h  burst=%h",  instName, addrTop, dataTop, PCIc.burstC);
         endfunction
       endclass : PCITop

           PCITop PCI1, PCI2;
           initial begin;
             PCI1 = new (32'h 0000_00ff, 32'h f0f0_f0f0, 8'h12);
             PCI1.disp("PCI1");
             PCI2 = new (1,2,3);
	     PCI2.copy(PCI1);    //deep copy PCI1 into PCI2

             PCI2.disp("PCI2"); //copied content displayed
             PCI2.addrTop = 32'h1234_5678;
             PCI2.dataTop = 32'h5678_abcd;
             PCI2.PCIc.burstC = 8'h 9a;
             PCI2.disp("PCI2");
             PCI1.disp("PCI1");
           end
       endmodule

/*Simulation log:
[PCI1] addr = 000000ff data = f0f0f0f0 burst=12
[PCI2] addr = 000000ff data = f0f0f0f0 burst=12
[PCI2] addr = 12345678 data = 5678abcd burst=9a
[PCI1] addr = 000000ff data = f0f0f0f0 burst=12

in this function we explicitly copy the properties of PCITop and also 
copy the contents of the nested object PCIc. So, now the properties as well as the 
object contents are a copy, meaning the properties as well as object contents of PCI1 
and PCI2 point to different locations in memory. On calling the copy method, new 
memory will be allocated to the variables and the objects.



*/