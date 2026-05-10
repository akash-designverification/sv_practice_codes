// here constraint defined in class will be overridden by contsraint in module.
class sft;
  rand bit [3:0] data;
//class constraint converted to 'soft' constraint
  constraint data_range { soft data > 'hf; }
endclass
module soft_constr;
  initial begin
    sft sf;
    sf = new( );
    repeat(4) begin
    //inline constraint - hard
      sf.randomize( ) with { data <= 'ha;};
      $display("\data = %0h",sf.data);
    end
  end
endmodule