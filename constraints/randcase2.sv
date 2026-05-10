module TOP;
    int x;
    real c1, c2, c3, c4;
    real p1;
    initial begin
      c1=0; c2=0; c3=0; c4=0;
      repeat (1000) begin
        randcase
           5 : x = 1;
           15 : x = 2;
           25 : x = 3;
           10 : x = 4;
        endcase
        if (x == 1) c1 = c1+1;
        if (x == 2) c2 = c2+1;
        if (x == 3) c3 = c3+1;
        if (x == 4) c4 = c4+1;
      end
      $display("c1 = %0d c2 = %0d c3 = %0d c4 = %0d",
                c1, c2, c3, c4);
      $display("Probability of x = 1; is %0f", c1/1000);
      $display("Probability of x = 2; is %0f", c2/1000);
      $display("Probability of x = 3; is %0f", c3/1000);
      $display("Probability of x = 4; is %0f", c4/1000);
    end
  endmodule

/*
Simulation log:
c1 = 88 c2 = 260 c3 = 455 c4 = 197
Probability of x = 1; is 0.088000
Probability of x = 2; is 0.260000
Probability of x = 3; is 0.455000
Probability of x = 4; is 0.197000 */