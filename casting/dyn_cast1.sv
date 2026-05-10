module tb;
       typedef enum { soccer=2, cricket=4, football=10 } sports;
       sports   mS;
       int i;
       initial begin
         i = 10;
         mS = i; //Synopsys-VCS - WARNING - incompatible types
                 //Mentor Questa/Aldec-Riviera - run time ERROR
         $cast(mS, i); //$cast as a task - match types
         $display ("Sports=%s", mS.name( ));
         i = mS; //No Warning or Error
         $display("i=%0d",i);
         i=50;
         //$cast (mS, i); //ERROR - 50 is not a valid value for enum
         if ($cast (mS, i)) //$cast as a function
           $display ("Cast passed");
         else
           $display ("Cast failed");
       end
     endmodule 