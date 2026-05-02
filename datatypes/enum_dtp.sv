module enumdatatype1;
         enum bit [3:0] {red, green, blue=5} color;  
         typedef enum { read=10, write[5], intr[6:8] } E1;
         E1 e1 = write0; //initialize with a member of the enum
         int i1;
         initial begin
             i1 = green;   
             $display("i1 = %0d",i1);
             $display ("e1.name=%s",e1.name);
             e1 = e1.last ( );
             $display ("e1.last=%0d e1.name=%s",e1, e1.name);
             $display ("color.name = %s", color.name);
  $display("red=%s green=%d blue=%d",color.name,green,blue);
             $display ("red=%d green=%d blue=%d",red,green,blue); //OK
             $display ("write0=%0d write1=%0d write2=%0d write3=%0d 
write4=%0d", write0, write1, write2, write3, write4);
           end
       endmodule