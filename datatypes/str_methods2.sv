module sMethods;
       string s1 = "hello";
       string s2 = "hello world";
       string s4;
       string s5 = "GOODBYE";
       string s6 = "123_456_CC";
       string s7 = "fff_000_bb";
       byte x;
       integer s2len, s3len, i1, i2;
      initial
         begin
           #15;
           s2len = s2.len( );
           $display("String Length s2 = %0d",s2len);
           s1.putc(0,"C"); //replace 0'th character with 'C'
           $display("String s1 = %s",s1);
           x = s1.getc(0); //get 0'th character of string s1.
           $display("0'th character of string 'Cello' = %s",x);
           s4 = s2.toupper( ); //convert string 's2' to upper case
           $display("Upper Case of 'hello world' = %s",s4);
           s4 = s5.tolower ( );
           $display("Lower case of 'GOODBYE' = %s",s4);
           i1 = s6.atoi ( );
           $display("s6.atoi of string s6 '123_456_CC' = %0d",i1);  
           s6.itoa (i1);

           $display("s6.itoa = %s",s6);
           i2 = s7.atohex ( );
           $display("s7.atohex of string s7 'fff_000_bb' = %h",i2);
         end
     endmodule