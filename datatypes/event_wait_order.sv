module et;
       event etrig1, etrig2;
       initial begin
         #10;
         -> etrig1; //trigger named event 'etrig1'
         #10;
         -> etrig2; //trigger named event 'etrig2'
         #10;
         -> etrig1; //trigger named event 'etrig1'   
         #100;
       end
       initial begin
         //wait_order (etrig2 , etrig1); //FATAL ERROR 
         //$display("'wait' etrig2, etrig1  occurred at time %0t",$time);
         wait_order (etrig1 , etrig2); //OK
         $display("'wait' etrig1, etrig2  occurred at time %0t",$time);
//          wait_order (etrig2 , etrig1); //OK
//          $display("'wait' etrig2, etrig1 occurred at time %0t",$time);
       end
     endmodule