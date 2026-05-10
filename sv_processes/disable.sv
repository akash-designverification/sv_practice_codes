 module dsabl;
        bit a, b;
         initial begin : init_block
           a = 0;
           #10;
           a = 1;
           disable init_block;
           $display($stime,,, "after disable init_block");
                   //will never execute
         end
         always @(posedge a)
           begin : outer_block
             begin : inner_block
               #20 b = 1;
               if (a == 1) disable inner_block;
             end
             $display($stime,,, "From outer_block");
           end
       endmodule
//Simulation log:
//20 From outer_block