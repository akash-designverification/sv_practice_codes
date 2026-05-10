class bus;
   rand byte addr [4];
   rand byte data [4];

constraint avalues {foreach( addr[i] ) addr[i] inside {1,2,3,4}; }
   constraint dvalues {foreach( data[j] ) data[j] == 16 * j;}
endclass
module constr_iteration;
  initial begin
    bus b1;
    b1 = new();
    b1.randomize();
foreach(b1.addr[i]) $display("\t addr[%0d] = %0d  
b1.addr[i]);
", i, 
foreach(b1.data[i]) $display("\t data[%0d] = %0d", i, b1.
data[i]);
  end
endmodule
/* Simulation log:
addr[0] = 4
addr[1] = 1
addr[2] = 3
addr[3] = 2
data[0] = 0
data[1] = 16
data[2] = 32 */
