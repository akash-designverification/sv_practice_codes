class arrayClass;
  rand bit[7:0] dyn_array [ ];
  rand bit[7:0] queue [$];
  // Assign size of the queue
  constraint qsize  { queue.size( ) == 3; }
  // Constrain each element of both the arrays
  constraint arrays  { foreach (dyn_array[i])
                          dyn_array[i] == i*10;
                        foreach (queue[i])
                          queue[i] == i*20;
                      }
  function new ( );
    dyn_array = new[4];      // Assign size of dynamic array
  endfunction
endclass
module tb;
  arrayClass ac = new;
  initial begin
    ac.randomize();
$display ("dyn_array = %p \nqueue = %p", ac.dyn_array, ac.queue);
  end
endmodule