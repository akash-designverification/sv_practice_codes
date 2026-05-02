 module union_example;
         logic [31:0] x;
       typedef union { //OK - Unpacked - different sizes OK
           int a;
           byte b;
           bit [15:0] c;
       } data;
       data d1;
         initial begin
           d1.a = 32'h ffff_ffff; //write to d1.a
           x = d1.b; //read from d1.b
           $display("x = %h",x);
           d1.b = 8'h 01; //write to d1.b
           x = d1.a; //read from d1.a
           $display("x = %h",x);
           d1.c = 16'h 1010; //write to d1.c
           x = d1.a; //read from d1.a
           $display("x = %h",x);
         end
       endmodule