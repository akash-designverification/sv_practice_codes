module Cast;
       real rNum;
       int  iNum;
       string s1;
       logic [7:0] A1;
       logic signed [7:0] A2;
       initial begin
         rNum = (2.3 * 3.2);
         //real to int casting
         $display("\n real to int casting");
         iNum = int'(rNum); // or iNum = int'(2.3 * 3.2);
         $display("real value is %f", rNum);
         $display("int  value is %0d",iNum);
         $display("\n Signed casting");
         iNum = -10;
         rNum = signed'(iNum);
         $display("real value is %f", rNum);
         $display("int  value is %0d",iNum);
         $display("\n Unsigned casting");
         iNum = -10;
         rNum = unsigned'(iNum);
         $display("real value is %f", rNum);
         $display("int  value is %0d", iNum);
         A1 [0 +: 8] = unsigned'(-4); //A1 = A1[7:0]
         A2 = signed'(4'b1100);
         $display("\n A1 = %b A2 = %0d", A1, A2);
         //String to int casting
          $display("\n String to int casting");
         iNum = int'(s1);
         $display("String s1 = %0p int iNum=%0d",s1,iNum);
       end
     endmodule