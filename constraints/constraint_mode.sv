class sft;
  rand bit [3:0] data, addr;
  constraint data_range1 { data <= 'h4; }
  constraint addr_range1 { addr > 'ha; }
endclass
module soft_constr;
  initial begin
    sft sf;
    sf = new();
    sf.data_range1.constraint_mode(0);
    sf.addr_range1.constraint_mode(0);
    repeat (4) begin
      sf.randomize( );
      $display("addr = %h data = %h",sf.addr, sf.data);
    end
    sf.constraint_mode (1);//Turn ON all constraints
    repeat (4) begin
      sf.randomize( );
      $display("addr = %h data = %h",sf.addr, sf.data);
    end
  end
endmodule