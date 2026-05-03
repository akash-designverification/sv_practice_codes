module assoc_arr;
         integer St [string] = '{"Peter":26, "Paul":24, "Mary":22};
         integer data;
       initial
         begin
           $display("St=",St);
           $display("data stored at Peter = %0d",St["Peter"]);
           $display("data stored at Paul = %0d",St["Paul"]);
           $display("data stored at Mary = %0d",St["Mary"]);
           St["mike"] = 20;   //new data stored at new index "mike"
           data = St["mike"]; //retrieve data stored at index "mike"
           $display("data stored at mike = %0d",data);
           $display("St=",St);
         end
       endmodule