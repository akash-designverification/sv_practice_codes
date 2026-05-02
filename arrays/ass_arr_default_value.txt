module assoc_arr;
        string words [int] = '{default: "hello"};
         initial begin
           $display("words = %p", words['hffff]); //default
           $display("words = %p", words[0]); //default
           $display("words = %p", words[1000]); //default
           words['hffff] = "goodbye";
           $display("words = %p", words);
          $display("words = %p", words[100]); //default
         end
       endmodule