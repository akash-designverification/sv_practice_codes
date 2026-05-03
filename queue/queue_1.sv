module dq;
         // A queue of 8-bit bytes – unbounded queue
         bit[7:0] dq1[$];
         // A queue of strings – unbounded queue
         string mname[$] = { "Bob" };
         // An initialized queue – unbounded queue
         bit[15:0] dq2[$] = { 3, 2, 7, 1 };
         // A bounded queue – size = 256. Maximum index @255.
         bit q2[$:255];
         //bit q2[255:$]; // Compile ERROR – invalid syntax
         int dq2_size;
         initial
           begin
             dq1[0] = 'hff;
             dq1[1] = 'h00;
             dq1[$] = 'h01;  //last entry - will override dq1[1]='h00
             $display($stime,,,"dq1=%h",dq1);
             dq1[1] = 'h02;
             $display($stime,,,"dq1=%0h", dq1);
             mname[1] = "mike"; //push-in - grow the queue
             $display($stime,,, "mname=", mname);
             //displays initialized 4 entries
             $display($stime,,,"dq2=", dq2);
             dq2[4] = {16'h 1111};
             $display($stime,,,"dq2=%h", dq2);
             q2[0] = 1;
             q2[1] = 0;
             $display($stime,,, "q2=",q2);
             q2[3] = 1;  //skipped entry '2' - so no 3rd entry
             $display($stime,,, "q2=",q2);
             dq2_size = dq2.size( );
             $display($stime,,,"dq2 size = %0d",dq2_size);
             for (int i = 0; i < dq2_size; i++) //read the 
               $display($stime,,,"dq2[%0d] = %0h", i, dq2[i]);
             //insert a value at index 256 which is out of bound
             //dq2.insert(256,1); //You get a run-time Error
           end
       endmodule