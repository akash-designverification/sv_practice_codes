class packet;
        local int addr; //local property
        local function void disp(input int data); //local method
           $display("data = %h", data);
           $display("addr = %h", addr); //access local property
         endfunction
       endclass
       module class_TOP( );
         initial begin
           packet p1;
           p1 = new( );
          // p1.addr = 'hff;
             //COMPILE ERROR - can't access 'local' property
          // p1.disp(20);
             //COMPILE ERROR - can't access 'local' method
	end
	endmodule

