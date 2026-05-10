module OP;
  logic [7:0] data1, data2, data3;
  logic A1, A2, A3;
  logic enb;
  string s1;
  initial begin
    data1 = {8{1'b0}}; //data1 = 00000000
    $display("data1 = %b",data1);
    enb = 1;
    data1 = {8{enb}}; //data1 = 11111111
    $display("data1 = %b",data1);
    data1 = { {4{enb}} , 4'b0}; //data1 = 11110000
    $display("data1 = %b",data1);
    data1 = { {0{1'b1}} , 4'b1111};
                 //{0{1'b1}} is ignored; data1=00001111
    $display("data1 = %b",data1);
  end
endmodule


/*
Simulatinon log:
data1 = 00000000
data1 = 11111111
data1 = 11110000
data1 = 00001111
*/