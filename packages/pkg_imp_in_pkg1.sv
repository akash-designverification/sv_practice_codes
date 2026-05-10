package P1;
         int  a = 1;
       endpackage : P1
       package P2;
         import P1 :: *;
         int  b = 2;
       endpackage : P2
       module TRY1( );
         import P2 :: *;
         initial begin
           $display("top : P1::a = %0d", a);
           $display("top : P2::b = %0d", b);
         end
       endmodule : TRY1
/*Error-Identifier not declared
In this example, we declare two packages “P1” and “P2.” “P1” has the variable 
“a” and “P2” has the variable “b” declared in it. We then import P1::* into the pack
age “P2”. This means that variable “a” will be visible in package “P2.”
not in module.*/