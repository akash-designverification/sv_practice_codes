 module tagged_union_example;
         logic [31:0] x;
         typedef union tagged {
           int a;
           byte b;
           bit [15:0] c;
       } data;
	data d1;
         initial begin
           d1 = tagged a 32'hffff_ffff; //write to 'a'
           //read from 'b'. Since 'a' was written last, cannot access
           //'b'. - Error
           x = d1.b;
           $display("x = %h",x);
         end
       endmodule