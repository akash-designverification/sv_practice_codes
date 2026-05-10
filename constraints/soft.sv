/* 
the keyword “soft” added in the constraint. This will allow the constraint 
solver to override this constraint and use other non-conflicting constraints to con
strain the randomized values.*/

class sft;
  rand bit [3:0] data;
  // 'soft' constraint
  constraint data_range { soft data > 'hf; }
  constraint data_range1 { data <= 'ha; }
endclass
module soft_constr;
  initial begin
    sft sf;
    sf = new();
    repeat(4) begin
      sf.randomize( );
      $display("\data = %0h",sf.data);
    end
  end
endmodule