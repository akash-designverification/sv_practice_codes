module assoc_arr;
       class AB;
         int a;
         int b;
       endclass
       int arr[AB]; //Associative array 'arr' with class 'AB'  as index
       AB obj, obj1;
       initial begin
         obj = new();
         obj1= new();
         arr[obj]=20; 
 //Store 20 at the object handle index 'obj'
         $display("%0d",arr[obj]);
         arr[obj1]=10; //Store 10 at the object handle index 'obj1'
         $display("%0d",arr[obj1]);
       end
       endmodule
