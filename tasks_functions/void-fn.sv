 module mVoid( );
         function void func1;
           $display ("Time = %0t",$stime);
         endfunction
         initial begin
           for (int i = 0; i < 4; i++) begin
             #1;
             func1 ( );
           end
         end
       endmodule
/*Time = 1
Time = 2
Time = 3
Time = 4  */