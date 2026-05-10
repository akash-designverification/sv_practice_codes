//The concatenation is treated as a packed vector of bits


module OP;
  logic [7:0] data1, data2, data3;
  logic A1, A2, A3;
  logic enb;
  string s1;
initial begin
    data1 = {4'b 0101, 4'b 1010};
    $display("data1 = %b",data1);
    A1 = 1'b0;
    A2 = 1'b1;
    A3 = 1'b0;
    enb = 1'b0;
    data1 = {A1, A2, A3, enb, 4'b 1010};
    $display("data1 = %b",data1);
    {A1, A2, A3} = 3'b101;
    data3 = 8'b 0;
    data2 = 8'b 0000_0001;
    data1 = {data2 + data3}[7:0];
    $display("data1 = %b",data1);
    s1 = {"hi", " ", "later"};
    $display("string s1 = %p",s1);
  end
endmodule

/* data1 = 01011010
data1 = 01001010
data1 = 00000001
string s1 = "hi later" */