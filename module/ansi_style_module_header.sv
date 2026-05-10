/* since the port direction/type is declared for the previous port “b,” the ports “c” and “d” take on the same direction and type.
The following will give an error because “c” and “d” have already taken on 
the “output” direction and “logic” type from port “b.” So, redeclaring ports “c” and 
“d” will give errors (even though they look like non-ANSI-style port declarations). 



module test0 (input a, output logic b, c, d); //OK – line 1
         inout c; //ERROR – line 2
         output d; //ERROR – line 3
         initial begin
           b = 0;
           d = 0;
           $display("b=%0d c=%0d d=%0d",b,c,d);
         end
       endmodule

