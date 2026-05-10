virtual class BaseClass;
         //pure virtual method can be declared only in a virtual class.
         //pure virtual method can only be a prototype.
         //Cannot have implementation.

         pure virtual function void disp( );

         //You can indeed define a virtual function/task as well

         virtual function void disp1( );
	$display("Virtual Function 'disp1' from class BaseClass");
	endfunction

         //You can also define a regular function/task

         function void disp2( );
           $display("Function 'disp2' from BaseClass");
         endfunction
       endclass

       class ChildClass extends BaseClass;
           //MUST define implementation of 'disp' since it is declared
           //'pure virtual' in 'virtual class' BaseClass

           function void disp( );
             $display("pure virtual function 'disp' of baseClass implemented in class ChildClass");
          endfunction

           function void disp1( );
             $display("virtual function 'disp1' of baseClass overridden in class ChildClass");
              endfunction

       endclass

       module tb;
           BaseClass base;
           ChildClass child;
       initial begin
       //base = new; //cannot instantiate virtual class - Compile ERROR
             child = new;
             base = child; //upcasting
             base.disp;
             base.disp1;
             base.disp2;
       end
       endmodule

/* Simulation log: 
pure virtual function 'disp' of baseClass implemented in class ChildClass
virtual function 'disp1' of baseClass overridden in class ChildClass
Function 'disp2' from BaseClass