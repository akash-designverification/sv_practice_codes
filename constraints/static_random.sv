
/* 
Random variables declared as static are shared by all instances of the class in which 
they are declared. Each time the randomize( ) method is called, the static variable is 
changed(refletcs its value) in every class instance. */

class StaticRandom;
  //static random variable – shared by all instances
  rand static integer Var1;
  rand int Var2;
endclass
module TOP;
  StaticRandom s1 = new;
  StaticRandom s2 = new;
initial begin
  repeat(2)
  begin
    void'(s1.randomize( ));
$display("s1.Var1 : %d  s1.Var2 : %d : s2.Var1 : %d  s2.Var2 : 
%0d :", s1.Var1,s1.Var2,s2.Var1,s2.Var2);
  end
end
endmodule

/*
Simulation log:
s1.Var1 : 409176739 s1.Var2 : 1499859087 : s2.Var1 : 409176739 s2.Var2 : 0 
s1.Var1 : -1430829098 s1.Var2 : 100214679 : s2.Var1 : -1430829098 s2.Var2 : 0   */