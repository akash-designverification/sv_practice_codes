//2-d_unpacked
module tb;

	  // 4 entries(rows) of 8 bits(columns) each
          // Total packed dimension (contiguous bits) = 4*8 = 32 bits
         
	  bit [3:0][7:0]   m_data;
          initial begin
           m_data = 32'h0102_0304;//Assign to 32 contiguous bits
           //display 2-d packed array as a contiguous set of bits
           $display ("m_data = 0x%h", m_data);
           //display 1 byte each stored at m_data[0]...m_data[3]
           for (int i = 0; i < 4; i++) begin
               $display ("m_data[%0d] = 0x%h", i, m_data[i]);
           end
         end
       endmodule