class sft;
  rand bit [3:0] data, addr;
  constraint data_range1 { data <= 'ha; }
  function void pre_randomize ( );
$display ("\n User-defined pre_randomize called before randomize( )");
    $display("data = %0h",data);
    $display("addr = %0h",addr);
    addr.rand_mode(0); //disable addr randomization
  endfunction
  function void post_randomize ( );
$display ("\n User-defined post_randomize called after randomize( )");
      $display("data = %0h",data);
      $display("addr = %0h",addr);
  endfunction
endclass
module PrePost_constr;
  initial begin
    sft sf;
    sf = new();
    repeat (2) sf.randomize( );
  end
endmodule


/*Simulation log:
User-defined pre_randomize called before randomize( )
data = 0
addr = 0
User-defined post_randomize called after randomize( )
data = 3
addr = 0
User-defined pre_randomize called before randomize( )
data = 3
addr = 0
User-defined post_randomize called after randomize( )
data = 9
addr = 0
*/