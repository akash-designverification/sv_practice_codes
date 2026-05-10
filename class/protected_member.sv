class packet;
        protected int addr;
        protected function void disp(input int data);
          $display("From packet");
          $display("\t data = %h", data);
          $display("\t addr = %h", addr);
         endfunction
       endclass

       class eth_packet extends packet;
         function set_addr;
           addr = 'hff;
			//protected property 'addr' visible to extended class
         endfunction
	
	function void eth_disp;
           super.disp('hff);
                 //protected method 'disp' visible to extended class
         endfunction

         function void disp(input int data);
                 //OK to override 'protected' method in extended class
           $display("From eth_packet");
           $display("\t data = %h", data);
         endfunction

       endclass
      
	 module class_TOP( );

         initial begin
           packet p1;
           eth_packet e1;
           e1 = new( );
           p1 = new( );
           //p1.disp(20); //COMPILE ERROR
           //protected methods 'disp' not visible outside the class
           e1.eth_disp;
           e1.disp('h ffff);
         end
       endmodule

/* Simulation log:
From packet
data = 000000ff
addr = 00000000
From eth_packet
data = 0000ffff  */