module OP;
  integer a, b, c, d;
  real e, f, g, h;
  initial begin
    /*** DIVISION ***/
    $display("\n DIVISION \n");
a = 10; b= 3;
    c = a/b;  //c=3
    $display("c = 10/3 :: a = %0d b = %0d c = %0d", a , b, c);
           //Integer division truncates any fractional part to 0
    a = 3.4; b = 2.3; //Truncate a and b since they are integers
    c = a/b; //c=1
    $display("integer c = 3.4/2.3 :: a = %0f b = %0f c = %0f",
              a , b, c);
    e = 3.4; f = 2.3; //No truncation since e and f are real
    g = e/f; //g=1.478
    $display("real g = 3.4/2.3 :: e = %0f f = %0f g = %0f",
              e, f, g);
    /*** A TO THE POWER of B ***/
    $display("\nA to the Power of B \n");
    a = 3.4; b = 2.3; //Truncate a and b since they are integers
    c = a**b;  //c=9
    $display("integer c = 3.4**2.3 :: a = %0f b = %0f c = %0f",
              a , b, c);
    e = 3.4; f = 2.3; //No truncation since e and f are real
    g = e**f; //g=16.687
    $display("real g = 3.4**2.3 :: e = %0f f = %0f g = %0f",
              e, f, g);
    e = 9; f = 0.5;  //square root
    g = e**f; //g=3.0
    $display("real g = 9**.5 :: e = %0f f = %0f g = %0f",
              e, f, g);
    a = 0; b= 3; //0**3 = 0
    c = a**b;
    $display("c = 0**3 :: a = %0d b = %0d c = %0d", a , b, c);
    a = 0; b= -3; //0**-3 = x
    c = a**b;
    $display("c = 0**-3 :: a = %0d b = %0d c = %0d", a , b, c);
    //-2**3 = -8 : takes on the sign of first operand
    a = -2; b= 3;
    c = a**b;
    $display("c = -2**3 :: a = %0d b = %0d c = %0d", a , b, c);
    /*** A modulo B (A % B) ***/
    $display("\n A modulo B\n");
    a = 10; b= 3; //10 % 3 = 1
    c = a%b;
    $display("c = 10 modulo 3 :: a = %0d b = %0d c = %0d",
              a , b, c);
    a = -10; b= 3; //-10 % 3 = -1
                 //Result takes the sign of the first operand
    c = a%b;
    $display("c = -10 modulo 3 :: a = %0d b = %0d c = %0d",
              a , b, c);
    a = 10; b= -3; //10 % -3 = 1
                 //Result takes the sign of the first operand
    c = a%b;
    $display("c = 10 modulo -3 :: a = %0d b = %0d c = %0d",
              a , b, c);
    a = 0; b= 3; //0 % 3 = 0
    c = a%b;
    $display("c = 0 modulo 3 :: a = %0d b = %0d c = %0d",
              a , b, c);
    a = 3; b= 0; //3 % 0 = x
    c = a%b;
    $display("c = 3 modulo 0 :: a = %0d b = %0d c = %0d",
              a , b, c);
  end
endmodule