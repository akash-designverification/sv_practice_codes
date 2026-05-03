module tb;
         // queue of class type 'animals'
         animals alist [$];
         initial begin
           animals f, f2; //declare two variables of type animals
           // Create a new class object 'f' and push into the queue
           f = new ("lion");
           alist.push_front (f);
           // Create another class object 'f2'and push into the queue
           f2 = new ("tiger");
           alist.push_back (f2);
           // Iterate through queue and access each class object
           foreach (alist[i]) begin
             $display ("alist[%0d] = %s", i, alist[i].sname);
             $display ("alist[%0d] = %p", i, alist[i]);
           end
           // Simply display the whole queue
           $display ("alist = %p", alist);
         end
       endmodule