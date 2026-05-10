module random;
  integer in1, in2, sin1;
  bit [63:0] bi1;
  int seed,i1;
  initial begin
    $display("\n$urandom( ) – same seed");
      seed=1234;
      repeat (4) begin //same seed through each iteration
        in1 = $urandom(seed); //with seed
        in2 = $urandom & 'h0000_00ff; //Mask top 24-bits
        bi1 = {$urandom, $urandom}; //64-bit random number
        $display("in1=%0h in2=%0h bi1=%0h",in1,in2,bi1);
        #1;
      end
$display("\n$urandom( ) – changing seed");
      seed=1234;
      repeat (4) begin
        seed=seed+1; //different seed through each iteration
        in1 = $urandom(seed); //with seed
        in2 = $urandom & 'h0000_00ff; //Mask top 24-bits
        bi1 = {$urandom, $urandom}; //64-bit random number
        $display("in1=%0h in2=%0h bi1=%0h",in1,in2,bi1);
        #1;
      end
      $display("\n$urandom_range( )");
      repeat (4) begin
        in1 = $urandom_range(15,7);  //max_value > min_value
        in2 = $urandom_range(0,15);  //max_value < min_value
        bi1 = $urandom_range(7); //No min_value. So, 7...0
        $display("in1=%0d in2=%0d bi1=%0d",in1,in2,bi1);
      end
      process::self().srandom(1234);
      in1 = $urandom; // seed set by srandom
      $display("in1=%h",in1);
    end
endmodule
/*
Simulation log:
$urandom( ) - same seed
in1=d473f645 in2=ce bi1=46d3933a17f96ab4
in1=d473f645 in2=ce bi1=46d3933a17f96ab4
in1=d473f645 in2=ce bi1=46d3933a17f96ab4
in1=d473f645 in2=ce bi1=46d3933a17f96ab4
$urandom( ) - changing seed
in1=f7c14f9 in2=8e bi1=d4d64b41c99e7e59
in1=4ae225b5 in2=ef bi1=59fa737b1b1b34a0
in1=30310970 in2=18 bi1=cfb535dbb9987038
in1=8de5b5bf in2=4c bi1=f16b5c1f826512c5
$urandom_range( )
in1=12 in2=2 bi1=4
in1=8 in2=9 bi1=7
in1=11 in2=1 bi1=0
in1=14 in2=1 bi1=7
in1=d473f645
*/