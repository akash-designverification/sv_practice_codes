//set membership

class myClass;
  rand bit [3:0]   cVar, cVar2;
  // Inverted inside: Constrain c_var to be outside 3 to 7
  constraint c_var { !(cVar inside {[3:7]}); } //OUTSIDE
  //inside: Constrain c_var2 to be inside 3 to 7
  constraint c_var2 { cVar2 inside {[3:7]}; } //INSIDE
endclass
module TOP;
  initial begin
    myClass mC = new( ); //instantiate/construct class
    $display("Constraint cVar to be outside 3 to 7");
    repeat (5) begin
      mC.randomize( ); //randomize variables of class
      $display("mC.cVar = %0d", mC.cVar);
	end
    $display("Constraint cVar2 to be inside 3 to 7");
    repeat (5) begin
      mC.randomize( );
      $display("mC.cVar2 = %0d", mC.cVar2);
    end
  end
endmodule