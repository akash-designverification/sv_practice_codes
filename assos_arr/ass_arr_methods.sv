module assoc_arr;
       int temp, imem[int];
       integer St [string] = '{"Peter":20, "Paul":22, "Mary":23};
       initial
         begin
if(St.exists( "Peter") ) $display(" Index Peter exists ");
           //Assign data to imem[int]
           imem[ 2'd3 ] = 1;
           imem[ 16'hffff ] = 2;
	  imem[ 4'b1000 ] = 3;
           $display( " imem has %0d entries", imem.num );
           if(imem.exists( 4'b1000)) $display("Index 4b'1000 exist)");
           imem.delete(4'b1000);
           if(imem.exists( 4'b1000)) $display("Index 4b'1000 exists)");
           else $display(" Index 4b'1000 does not exist");
           imem[ 4'b1000 ] = 3;
	 if(imem.first(temp)) $display(" First entry is at index %0d ",temp);
	if(imem.next(temp)) $display(" Next entry is at index %0b ",temp);
	if(imem.last(temp)) $display(" Last entry is at index %0h",temp);
           imem.delete( ); //delete all entries
           $display(" imem has %0d entries", imem.num );
           $display(" imem = %p", imem);
         end
       endmodule