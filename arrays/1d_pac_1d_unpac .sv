module PU;
           logic [31:0] v1 [7:0];  //1-D packed & 1-D unpacked (memory)
           initial begin
             //Array Index 7 of unpacked
             v1[7] = 'h FF_FF_FF_FF;  //equivalent to v1[7][31:0]
             $display(v1);
             //Array Index 6 of unpacked; 31:0 of packed
             v1[6][31:0] = 'h 11_11_11_11;
             $display(v1);
             //Array Index 5 of unpacked; 15:0 of packed
             v1[5][15:0] = 'h aa_aa;
             $display(v1);
             //Array Index 4 of unpacked; 0th bit of packed
             v1[4][0] = 1;
             $display(v1);
           end
         endmodule