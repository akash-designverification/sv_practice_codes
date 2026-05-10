 class thisClass;
       integer tint;
            function new (integer tint);
      this.tint = tint; //If you did 'tint=tint' – which
            endfunction
       endclass
/* When you do “this.tint = tint,” you 
are assigning the argument “tint” of the class constructor to the “thisClass” variable 
“tint.” If you simply did “tint=tint” in the function new( ), the compiler would not 
be able to distinguish between the two “tint”s, and you will get incorrect results 
(will not get compile/run-time error).*/