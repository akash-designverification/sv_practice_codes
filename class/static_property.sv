/* There are times when you need to maintain only one copy of the variable shared by all instances. 
Such class properties/variables are created using the keyword static. Static properties are allocated in 
memory at elaboration time and shared across all instances of the class. 
Static variable acts like a global variable in that only one copy exists, 
no matter how many objects you create. For a static variable, 
the storage is associated with the class declaration, 
not the multiple objects that are constructed dynamically. */



module class_TOP( );
        class base;
          static logic [31:0] data; //static property
        endclass : base
         base base1, base2;
           initial begin;
             base1 = new( );
             base2 = new( );
             base1.data = 32'h ff00_f0f0;
             $display("base2.data = %h",base2.data);
           end
           initial #10 $finish(2);
       endmodule

//Simulation Log:
//base2.data = ff00f0f0

