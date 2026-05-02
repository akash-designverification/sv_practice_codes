module darray; //copying of arrays
         int oarray [ ];
         int carray [ ];
         initial begin
           // Allocate 5 memory locations to "oarray" and
           // initialize with values
           oarray = new [5];
           oarray = '{1, 2, 3, 4, 5};
           carray = oarray;  // copy "oarray" to "carray"
           $display ("carray = %p", carray);
           
	//Grow size by 1 and copy existing elements to the "carray"
           carray = new [carray.size( ) + 1] (carray);
           $display("carray size = %0d",carray.size);
           // Assign value 6 to the newly added location [index 5]
           carray [carray.size( ) - 1] = 6;
           $display("carray[5]=%0d",carray[5]);
           // Display contents of new "carray"
           $display ("carray = %p", carray);
           oarray = carray; //copy carray to oarray
           $display ("oarray = %p", oarray);
           // Display size of both arrays
	$display ("oarray.size( ) = %0d, carray.size( ) = %0d", oarray.size( ), carray.size( ));
         end
       endmodule
