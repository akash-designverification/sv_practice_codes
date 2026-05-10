module dq;
         // int queue initialized
         int  queue1 [$] =  { 100,200,300,400,500 };
         int  queue2 [$];  // int queue
         int  tmp;
         initial begin
           // Get first item of queue1 (index 0) and store in tmp
           tmp = queue1 [0];
           $display("queue1[0] = ",tmp);
           // Get last item of queue1 (index 4) and store in tmp
           tmp = queue1 [$];
           $display("queue1[$] = ",tmp);
           // Copy all elements in queue1 into queue2
           queue2  = queue1;
           $display("queue2 = ",queue2);
           // Empty the queue1 (delete all items)
           queue1  = { };
           //OR you can also do 'queue1.delete( );'
           $display("queue1 = ",queue1);
           // Replace element at index 2 with 150
           queue2[2] = 150;
           $display("queue2 = ",queue2);
           // Inserts value 250 to index# 2
           queue2.insert (2, 250);
	   $display("queue2 = ",queue2);
           queue2 = { queue2, 220 }; // Append 220 to queue2
           $display("queue2 = ",queue2);
           // Put 199 as the first element of queue2
           queue2 = { 199, queue2 };
           $display("queue2 = ",queue2);
           // shift out 0th index (effectively 0th index deleted)
           queue2 = queue2 [1:$];
           $display("queue2 = ",queue2);
  	   // shift out last index (effectively last index deleted)
           queue2 = queue2 [0:$-1];
           $display("queue2 = ",queue2);
           // shift out first and last item
           queue2 = queue2 [1:$-1];
           $display("queue2 = ",queue2);
         end
       endmodule