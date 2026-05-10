module top;
class PacketBase;
  rand bit [7:0] src;
  rand bit [5:0] len;
  rand bit [7:0] payld [ ];
  constraint payload_size {payld.size > 0; payld.size < 15;}
endclass
class EtherPacket extends PacketBase;
  constraint c1 {src inside {[8'h2A:8'h2F]};}
  constraint c2 {len inside {[0:31]}; }
  constraint payload_size {payld.size > 15; payld.size < 20;}
  constraint c3 {foreach (payld[i]) { (payld[i]) == 'haa;} }
  function show;
    $display("EtherPacket = %h %h %h", src, len, payld);
endfunction:show
endclass
class stim_gen;
  task run;
    EtherPacket e1;
    e1 = new( );
    for(int i = 0; i<8; i++) begin
      e1.randomize;
      e1.show;
    end
  endtask
endclass: stim_gen
initial begin
  stim_gen st1;
  st1 = new( );
  st1.run;
end
endmodule
/* # EtherPacket = 2c 0a aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
# EtherPacket = 2f 0d aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
# EtherPacket = 2d 1d aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
# EtherPacket = 2b 06 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
# EtherPacket = 2a 09 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
# EtherPacket = 2c 0f aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
# EtherPacket = 2f 03 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
# EtherPacket = 2d 1e aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa */