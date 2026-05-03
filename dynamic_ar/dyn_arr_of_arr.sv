module darray;
        int abc[ ][ ];  //array of arrays
        initial begin
          abc = new[3]; //sub array still not created
          $display("abc = ",abc);
          //Create sub-arrays
          foreach (abc[i]) begin
            abc[i] = new[4];
            $display("abc[%0d] = %p", i, abc[i]);
          end
          $display("abc = ",abc);
          //assign values to array and sub-array
          foreach(abc[i , j]) begin
            abc[i][j] = (j+1)+i;
          end
          //display
          foreach (abc[i , j]) begin
            $display("abc[%0d][%0d] = %0d", i, j, abc[i][j]);
          end
          $display("abc = ",abc);
        end
       endmodule