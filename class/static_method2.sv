//access static method with clss scope resolution operator without instatiating class.

class setIt;
         static int      k;
         static function set (int p );
           k = p + 100;
         endfunction
       endclass
       module tbTop;
              initial begin
             setIt::set(10);
             $display("k = %0d",setIt::k);
             setIt::set(20);
             $display("k = %0d",setIt::k);
              end
       endmodule
/*Simulation log:
k = 110
k = 120*/