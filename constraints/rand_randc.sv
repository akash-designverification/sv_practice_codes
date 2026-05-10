 /*rand : values are uniformly distributed.

randc : randaomixation computes through all the valus in an ordered permutation declared within the range. */


class aClass;
   rand bit [1:0] addr;
   randc bit [1:0] rc;
  endclass
  module tb;
    initial begin
      aClass aC = new ( );
      for (int i = 0; i < 12; i++) begin
        aC.randomize( );
        $display ("i=%0d addr=%b rc=%b", i, aC.addr, aC.rc);
      end
    end
  endmodule
/*
i=0 addr=11 rc=01
i=1 addr=10 rc=00
i=2 addr=01 rc=10
i=3 addr=01 rc=11
i=4 addr=01 rc=10
i=5 addr=11 rc=01
i=6 addr=00 rc=00
i=7 addr=10 rc=11
i=8 addr=01 rc=00
i=9 addr=10 rc=11
i=10 addr=11 rc=10
i=11 addr=11 rc=01
*/