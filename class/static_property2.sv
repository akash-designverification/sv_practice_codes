class packet;
          static int packet_cnt;
          function new( );
            packet_cnt = packet_cnt+1;
            $display("From %0d",packet_cnt);
          endfunction
        endclass
         initial begin
           packet p1 = new;
           packet p2 = new;
         end
       endmodule

//Simulation log:
//From new ( ) :: packet_cnt = 1
//From new ( ) :: packet_cnt = 2