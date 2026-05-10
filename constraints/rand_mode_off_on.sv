class rmode;
  rand bit [3:0] data, addr;
  constraint data_range1 { data <= 'ha; }
 function void disp( );
    $display("data = %0h",data);
    $display("addr = %0h",addr);
  endfunction
endclass

module TOP;
  initial begin
    rmode sf;
    sf = new( );
    $display("\n rand_mode(0) - Individual");
    sf.data.rand_mode(0); //Turn OFF data random mode
    sf.addr.rand_mode(0); //Turn OFF addr random mode
    repeat (2) begin sf.randomize( );
      sf.disp;
    end
    $display("\n rand_mode(1) - Individual");
    sf.data.rand_mode(1); //Turn ON data random mode
    sf.addr.rand_mode(1); //Turn ON addr random mode
    repeat (2) begin sf.randomize( );
      sf.disp;
     end
    $display("\n rand_mode(0) - ALL");
    sf.rand_mode(0); //Turn OFF ALL random variables
    repeat (2) begin
     sf.randomize( );
      sf.disp;
    end
    $display("\n rand_mode(1) - ALL");
    sf.rand_mode(1); //Turn ON ALL random variables
	repeat (2) begin
     sf.randomize( );
      sf.disp;
    end
  end
endmodule