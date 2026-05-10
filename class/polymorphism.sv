 //polymorphism = inheritance + virtual methods + upcasting.

class vehicle; // Parent class
           virtual function vehicle_type( ); // Virtual function
               $display("vehicle");
           endfunction
           virtual task color( );  // Virtual task
	   $display("It has color");
           endtask
       endclass
       class four_wheeler extends vehicle;   //child class
         function vehicle_type( ); //override parent class virtual
                                   //function
           $display("It is a four wheeler");
         endfunction
         task color( ); //override parent class virtual task
                $display("It has different colors");
         endtask
       endclass
       class BENZ extends four_wheeler;   // "grand" child class
            function vehicle_type();
              $display("It is a Benz");
            endfunction
            task color();
                $display("It is Black");
            endtask
       endclass
       module polymorphism;
           initial begin
              vehicle vehcl;
              four_wheeler four_whlr;
              BENZ  benz;
             four_whlr = new ( );
             benz = new ( );
              vehcl=four_whlr;//parent class variable holding child
                            //class handle. No need to create an
                           //object (of vehcl) by calling a new method
              vehcl.vehicle_type( );
                    // accessing child (four_whlr) class method from
                    // parent class (vehcl) variable
               vehcl=benz;
               vehcl.vehicle_type( );
                //accessing "grand" child method from parent class
	     four_whlr=benz;
               four_whlr.color( );
               // accessing child class method from parent class
               // "four_whlr"
          end
       endmodule

/* Simulation log:
It is a four wheeler
It is a Benz
It is Black 

• Virtual method functionality is set at run time.
• Extending a virtual method requires strict method argument compatibility.
• A base class can have a non-virtual method, and an extended class can override 
that method with a virtual method.
• Once a method is declared to be virtual, all extended class overrides of that 
method will also be virtual, with or without the virtual keyword.



 */
