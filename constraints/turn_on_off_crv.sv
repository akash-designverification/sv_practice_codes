module crv;
  class PCIBus;
    rand bit[15:0] addr;
    rand bit[31:0] data;
    constraint addrw {addr[7:0] == 'h01;}
    constraint dataw {data[15:0] == 'hffff;}
endclass
  logic [31:0] result;
  initial begin
    PCIBus pBus = new ( ); //Instantiate PCIBus
    $display("\n pBus randomize");
    repeat (2) begin
      pBus.randomize; //randomize pBus
      $display ("addr = %h data = %h", pBus.addr, pBus.data);
    end
    $display("\n pBus randomize with constraint 'addrw' and 'dataw' turned OFF");
    pBus.addrw.constraint_mode(0); //turn OFF constraint
    pBus.dataw.constraint_mode(0); //turn OFF constraint
    repeat (2) begin
      pBus.randomize;
      $display ("addr = %h data = %h", pBus.addr, pBus.data);
    end
    $display("\n pBus randomize with constraint 'addrw' and 'dataw' turned ON");
    pBus.addrw.constraint_mode(1); //turn ON constraint
    pBus.dataw.constraint_mode(1); //turn ON constraint
    repeat (2) begin
      pBus.randomize;
      $display ("addr = %h data = %h", pBus.addr, pBus.data);
    end
    $display("\n constraint 'data' using the 'with' clause");
    repeat (3) begin
    pBus.randomize ( ) with {pBus.data >= 'hffff && pBus.data <= 'hf_ffff;};
      $display ("data = %h", pBus.data);
    end
  end
endmodule

/*  
addr = 3501 data = ad77ffff
addr = f401 data = 3de0ffff
pBus randomize with constraint 'addrw' and 'dataw' turned OFF
addr = 0966 data = acf08845
addr = 966a data = 2e4c76be
pBus randomize with constraint 'addrw' and 'dataw' turned ON
addr = 0101 data = 2bbeffff
addr = e401 data = cb1cffff
constraint 'data' using the 'with' clause
data = 0000ffff
data = 0002ffff
data = 0005ffff */