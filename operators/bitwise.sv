module OP;
  logic [31:0] a1, a2;
  int i1;
    initial begin
    a1 = 'h00_00_00_ff;
    a2 = 'hf0_f0_f0_f0;
    i1 = a1 & a2;
    $display("a1 = %h a2 = %h a1 & a2 = %h",a1,a2,i1);
    i1 = a1 | a2;
    $display("a1 = %h a2 = %h a1 | a2 = %h",a1,a2,i1);
    1 = a1 ^ a2;
    $display("a1 = %h a2 = %h a1 ^ a2 = %h",a1,a2,i1);
    i1 = a1 ~^ a2;
    $display("a1 = %h a2 = %h a1 ~^ a2 = %h",a1,a2,i1);
    i1 = a1 ^~ a2;
    $display("a1 = %h a2 = %h a1 ^~ l2 = %h",a1,a2,i1);
    i1 = ~a2;
    $display("a2 = %h ~a2 = %h",a2,i1);
  end

endmodule 

/* a1 = 000000ff a2 = f0f0f0f0 a1 & a2 = 000000f0
a1 = 000000ff a2 = f0f0f0f0 a1 | a2 = f0f0f0ff
a1 = 000000ff a2 = f0f0f0f0 a1 ^ a2 = f0f0f00f
a1 = 000000ff a2 = f0f0f0f0 a1 ~^ a2 = 0f0f0ff0
a1 = 000000ff a2 = f0f0f0f0 a1 ^~ l2 = 0f0f0ff0
a2 = f0f0f0f0 ~a2 = 0f0f0f0f */