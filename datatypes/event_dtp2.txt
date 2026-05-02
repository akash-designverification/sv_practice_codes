module et;
       event e1, e2, e3;
       initial begin
         #10;
          fork
            -> e1;
            -> e2;
            -> e3;
          join
       end
       always @(e1)  
         $display("event e1 triggered at time %0t",$time);
       always @(e2)  
         $display("event e2 triggered at time %0t",$time);
       always @(e3) 
         $display("event e3 triggered at time %0t",$time);
     endmodule