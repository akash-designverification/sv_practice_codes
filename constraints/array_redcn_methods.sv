class a_reduction;
  rand bit[7:0] Darray [7];
  constraint c {Darray.sum() with (int'(item))==30;}
endclass
module tb;
  a_reduction ar = new;
  initial begin
ar.randomize( );
    $display ("Darray = %p", ar.Darray);
  end
endmodule
 //Simulation log:

// Darray = '{4, 2, 6, 4, 0, 14, 0}
//int'(Darray[0]) + int'(Darray[1]) + … + int'(Darray[6]) == 30
//Simulation log shows that the constraint assigns values to Darray elements such 
//that the sum of all its elements is = 30.