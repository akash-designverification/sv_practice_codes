
//static method cannot access non-static properties,results in compile error.

module class_TOP( );
        class base;
          static logic [31:0] data ; //static property
          logic [31:0] addr; //dynamic property
          
	   static task munge; //Static method
            data = 32'h f0f0_f0f0; //OK to access static variable
	    //addr = 32'h ffff_0000; //NOT OK since addr is not static
            $display("data = %h", data);
          endtask
	
	 base base1;
         initial begin
           base1.munge;
         end
       endmodule