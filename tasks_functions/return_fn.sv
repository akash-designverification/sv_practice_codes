 module mFunc( );
         int data, address;
         int newval;
         int add;
         function int func1 (inout int dataIO, input int addressIN );
           func1 = addressIN + dataIO;
                   //return value assigned to function name
           //OR
           //return addressIN + dataIO;
//return value specified using 'return' statement
         endfunction
         initial begin
         address = 1; data = 9; add= 10;
           #1;
           newval =  add + func1 ( data,  address);
           $display($stime,,, "newval = %0d",newval);
         end
       endmodule
//Simulation log:
//1 newval = 20