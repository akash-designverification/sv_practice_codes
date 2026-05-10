/*  the scope resolution operator enables the following:
- Access to static public members (methods and class properties) from outside 
the class.
- Access to public or protected or non-static members of a superclass from the 
derived class.
-Access to all static elements of a class:– Static properties– Static methods– Typedefs– Enumeration– Structures– Unions
- Scope resolution operator also allows you to reference items in a package */

class packet;
         bit [31:0] addr;  //non-static var
         static bit [31:0] id; //static var
         typedef enum {RED, GREEN, BLUE} RGB;
                 //typedef enum is static by default
         extern static function void display (int a, b);
       endclass
       static function void packet::display (int a, b);
             $display("packet values a=%0d b=%0d",a,b);
       endfunction
       class eth_packet extends packet;
         function new;
           packet::addr = 'hff;
// Can access non-static members in derived class
           $display("packet addr = %h", packet::addr);
         endfunction
       endclass
       module sro_class;
         packet::RGB r1; //scope resolution operator for typedef
         int id=10;
         initial begin
           packet p;
           eth_packet ep;
           p = new( );
           ep = new ( );
           $cast(r1,1);
           $display("%s",r1);
	 packet::id = 20;
           packet::display(packet::id, id);
           //packet::addr = 'hff; //COMPILE ERROR
           //Can't access non-static members outside the class
         end
       endmodule

/* Simulation log:
packet addr = 000000ff
GREEN
packet values a=20 b=10 */