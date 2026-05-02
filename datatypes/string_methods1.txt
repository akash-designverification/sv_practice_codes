module datatype1; 
       string s2 = "helloworld";  
       string s3 = "hello\0world"; 
       string s4, s5;
       string s6 = "compare";  
       string s7 = "compare"; 
       string s8;
       integer s2len, s3len, s2c;
       initial begin
         #10;
         $display ("s2=%s s3=%s",s2,s3);
         #100 $finish;
       end
      initial begin
           #15; 
        s2len=s2.len( ); 
        $display("String Length s2 =%0d",s2len);
        s3len=s3.len( ); 
        $display("String Length s3 =%0d",s3len);
        if (s2 == s3) $display("s2 = s3"); 
        else $display("s2!=s3");
        if (s6 == s7) $display("s6 = s7");
        else $display("s6 !=s7");
        s4 = s2.substr(3,5);
        $display("s4 = %s",s4);
           s5 = "later ";
           s8 = {3{s5}};
           $display("s8 = %s",s8);
           s2c = s2[0];
           $display("s2c = %s",s2c);
         end         
      endmodule
