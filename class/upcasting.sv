class animals;
         string color = "white";
         function void disp;
           $display("color = %s", color);
         endfunction
       endclass
       class buffalo extends animals;
         string color = "black";
         function void disp;
           $display("color = %s", color);
         endfunction
       endclass
       program tb;
         initial begin
           animals p;
           buffalo c;
           c = new( ); //allocate memory for c
                       //this will allocate memory for both 'c' and 'p'
           p = c; //upcasting
           p.disp;
           c.disp;
         end
       endprogram