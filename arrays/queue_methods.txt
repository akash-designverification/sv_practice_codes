module dq;
         bit[7:0] dq1[$]; // A unbounded queue of unsigned 8-bit
         int q3[$:5] = {0,1,2,3,4,5}; //bounded queue
         int q3_size;
         int a;
         initial begin
             a = dq1.size( ); //empty queue
             $display ($stime,,, "empty dq1 size  = %0d",a);
            dq1[0] = 0; dq1[1] = 1; dq1[2] = 2;
             $display ($stime,,, "dq1 SIZE = %0d",dq1.size( ));
             $display ($stime,,, "dq1=",dq1);
             dq1.insert (3,3); //index, value
             $display($stime,,, "After Insert dq1 SIZE = %0d",dq1.size( ));
             $display ($stime,,, "dq1=",dq1);
             dq1.delete (3); //index
             $display ($stime,,, "After delete dq1 SIZE = %0d",dq1.size( ));
             $display ($stime,,, "dq1=",dq1);
             a = dq1.pop_front( ); //pop first entry of the queue
             $display ($stime,,, "dq1 pop front = %0d ",a);
             $display ($stime,,, "dq1=",dq1);
             a = dq1.pop_back( ); //pop last entry of the queue
             $display ($stime,,, "dq1 pop back = %0d ",a);
             $display ($stime,,, "dq1=",dq1);
             //push the first entry of the queue with '4'
             dq1.push_front(4);
             $display ($stime,,, "push front dq1=",dq1);
             //push the last entry of the queue with '5'
             dq1.push_back(5);
             $display ($stime,,, "push back dq1=",dq1);
            q3_size = q3.size + 5; //size > q3 size
//underflow : pop from index 6,7,8,9,10 – run time Warning
           for (int i = 0; i < q3_size; i++)
               $display($stime,,,"q3[%0d] = %0d", i, q3.pop_front( ) );
        
             //Solution for underflow - check for size before pop
             while (q3.size( ) > 0)
               $display($stime,,,"q3 = %0d", q3.pop_front ( ));
//overflow : push over the bound limit – run time Warning
             for (int i = 0; i < q3_size; i++) begin
               q3.push_front( i );
               $display($stime,,,"q3[%0d] :: q3 = %p", i , q3);
end
         end
       endmodule