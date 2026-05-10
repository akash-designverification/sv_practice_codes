/* Global Constant :-
For global constant properties, the constant value (initial value) is assigned at the 
time of declaration with :const” qualifier. Thereafter the same value is kept by that 
property. No update to that property value is allowed.

Instance Constant :-
For instance constant properties, it’s a two-step process. First, the property is 
declared inside the class with “const” qualifier. Second, the value of that property is 
assigned inside the constructor of that class, i.e., new( ) method of the class. Here 
after, this initialized value is not allowed to be updated. */



	class packet;
         const int serialNum = 'h1234; //Global const,Global constant is read-only
         const int packetID;           //Instance const/
         //serialNum = 'hff; //COMPILE ERROR
         
	//Instance const can only be assigned in the constructor.
 
         //packetID = 'h ffff; //COMPILE ERROR
         
         function new;
           packetID = 'h4567;
               //instance const assignment in the constructor
         endfunction

         function void disp(input int packetID);
           $display("From packet");
           $display("\t serialNum = %h",this.serialNum);
           $display("\t packetID = %h",this.packetID);
         endfunction

       endclass

       class eth_packet extends packet;
         function new;
           super.new;
           //Instance constant cannot be re-initialized.
           //packetID = 'h ffff; //COMPILE ERROR
         endfunction

         function void eth_disp;
           super.disp(packetID);
         endfunction
       endclass

       module class_TOP( );
         initial begin
	eth_packet e1;
           e1 = new( );
           e1.eth_disp;
         end
       endmodule
