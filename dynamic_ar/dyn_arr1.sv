module darray;
         integer da [ ]; //dynamic array ‘da’ of type integer
       initial
         begin
           da = new[4]; //construct and allocate a size of 4 elements
           $display($stime,,, "da size = %0d",da.size);
           da.delete( ); //delete elements of an array
           $display($stime,,, "da size = %0d",da.size);
           da = '{1,2,3,4}; //array initialization
           $display($stime,,, "da = ",da);
         end
       endmodule