module darray;
         bit [7:0] d_array1[ ];
         initial begin
           //memory allocation
           d_array1 = new[2];
           $display($stime,,, "d_array1 size = %0d",d_array1.size);
           $display("\n");
           //array assignment - changes the size of the array
           d_array1 = {2,3,4};  //add 1 more element to the array
           $display($stime,,, "d_array1 size = %0d",d_array1.size);
           $display($stime,,, "d_array1=",d_array1);
           $display("\n");
           d_array1[2]=5;
           $display($stime,,, "d_array1[0]=",d_array1[0]);
           $display($stime,,, "d_array1[1]=",d_array1[1]);
           $display($stime,,, "d_array1[2]=",d_array1[2]);
           $display($stime,,, "d_array1=",d_array1);
           $display("\n");
           d_array1[3]=6; //will not change the size of the array or
                          //add a new element - Warning
           $display($stime,,, "d_array1 size = %0d",d_array1.size);
           $display($stime,,, "d_array1=",d_array1);
           $display("\n");
           d_array1 = {2,3,4,6};
           $display($stime,,, "d_array1 size = %0d",d_array1.size);
           $display($stime,,, "d_array1=",d_array1);
           $display("\n");
           //increase the size of d_array1
           d_array1 = new [d_array1.size( ) + 1] (d_array1) ;
           $display($stime,,, "d_array1 size = %0d",d_array1.size);
           $display($stime,,, "d_array1=",d_array1);
         end
       endmodule