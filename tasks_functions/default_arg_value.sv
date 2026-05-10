 module top;
         logic [31:0] data;
         int addr;
         bit req, gnt;
task refT (logic [31:0] data = 'h1234, int addr, bit req = 0);
           $display($stime,,, "data = %0h addr = %0h req = %b",
                    data, addr, req);
         endtask
         initial begin
           refT( , addr , ); //data = 1234 addr = 0 req = 0
           refT( , 'h4567);  //data = 1234 addr = 4567 req = 0
           refT('h3456, 0, ); //data = 3456 addr = 0 req = 0
           refT(0, 1, 1); //data = 0 addr = 1 req = 1
           //refT( , , ); //ERROR - 'addr' does not have a default value
           //refT( ); //ERROR - 'addr' does not have a default value
           //refT(0, , 1); //ERROR - 'addr' does not have a default value
         end
       endmodule
/*Simulation log:
0 data = 1234 addr = 0 req = 0
0 data = 1234 addr = 4567 req = 0
0 data = 3456 addr = 0 req = 0
0 data = 0 addr = 1 req = 1*/