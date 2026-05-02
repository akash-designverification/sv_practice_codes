module et;
       event etrig;
       initial begin
         #10;
         -> etrig; //trigger named event 'etrig'
         #10;
         -> etrig; //trigger named event 'etrig'
       end
       always @(etrig) //execute when event etrig is triggered
                       //edge sensitive
         $display("@ etrig occurred at time %0t",$time);
       initial begin
         wait (etrig.triggered) ; //level sensitive 'wait' on the 
                                  //event 'etrig'
         $display("'wait' etrig occurred at time %0t",$time);
       end
     endmodule