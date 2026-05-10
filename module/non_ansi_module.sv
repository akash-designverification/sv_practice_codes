/* In the non-ANSI-style module header, separate declarations are used in the mod
ule_port_list. The direction of the ports is defined in the module declaration list not 
in the module header itself (i.e., the module I/O direction is declared outside of the 
module header).

 module complex_ports ( {c, d}, .e(f), i[31:0]);
          output logic c, d;
          output var [31:0] i;
          //input e;
          //ERROR : 'e' is not visible in module 'complex_ports'
          input f; //Correct
         initial begin
            i = 0; c = 1; d= 1;
         end
        endmodule
       module top;
         //wire g; //WARNING
         //1-bit expression is connected to 2-bit port
         wire [1:0] g; //Correct
         wire k, h;
         wire e;
         var [31:0] i;
         complex_ports cp1 ({k, h} , e);  //WARNING
              //fewer port connections than the module definition"
         complex_ports cp (g , e, i);  //Correct
       endmodule