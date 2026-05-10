module TOP;
    int x;
    initial begin
      repeat (10) begin
        randcase
          5  : x = 1; //weight : item = value;
          15 : x = 2;
          25 : x = 3;
          10 : x = 4;
        endcase
         $display("x = %0d",x);
      end
    end
  endmodule
/*
Simulation log:
x = 4
x = 3
x = 1
x = 2
x = 3
x = 3
x = 1
x = 2
x = 3
x = 3 */