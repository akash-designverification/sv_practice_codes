module datatype1;
  string s1 = "hello";
  string s2 = "hello world";
  string s3 = "hello\0world"; // \0 is ignored
  string s4, s5, s6;
     initial
       begin
         s4 = "later";
         s5 = "";         //empty string
         s6 = {"hi", s5}; //concatenation
         #10;
         $display ("s1=%s s2=%s s3=%s s4=%s s5=%s s6=%s", s1, s2, 
s3, s4, s5, s6);
         #100 $finish;
       end 
      endmodule