 module top;
         int a, result;
         initial begin
           a = $urandom % 6;
$display ("Before calling function : a=%0d result=%0d", a, result);
           result = mult(a);
$display ("After calling function : a=%0d result=%0d", a, result);
         end
         function int mult(ref int a);
           a = a + 5;
           return a * 10;
         endfunction
       endmodule
/* Simulation log:
Before calling function : a=2 result=0
After calling function : a=7 result=70 */