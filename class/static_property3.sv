module top;
class packet;
          static int packet_cnt; //Static property
          int tag; //Dynamic property
          function new( );
            packet_cnt = packet_cnt+1;
            tag = packet_cnt;
           // $display("packet_cnt = %0d tag = %0d",packet_cnt, tag);// display in function new,pktcnt=1,2 & tag=1,2
          endfunction
          function void disp( );
           $display("packet_cnt = %0d tag = %0d",packet_cnt, tag); // display in function new,pktcnt=2,2 & tag=1,2 
          endfunction
        endclass
         initial begin
           packet p1 = new;
           packet p2 = new;
           p1.disp;
           p2.disp;
         end
  
endmodule