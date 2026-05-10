/*
If there is a variable declared both 
in a class and also in the scope where randomize( ) is called, one needs to distin
guish between the two, as in the following example */

class C;
    rand integer x;
endclass
function int F(C obj, integer x);
  F = obj.randomize( ) with { x < local::x; };
endfunction

//In this example, the first “x” binds to the variable “x” in the class C, while the 
//local::x binds to the input of the function F