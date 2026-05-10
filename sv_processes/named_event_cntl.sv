module level;
         bit dma_interrupt;
         event process_dma; //named event
         initial begin
           dma_interrupt = 0;
           #10;
           dma_interrupt = 1;
         end
         always @(posedge dma_interrupt)
           begin
             //do something
             #10;
             ->process_dma; //trigger named event
             $display($stime,,, "trigger process_dma event");
           end
         always @(process_dma) begin //detect event edge
           $display($stime,,, "process_dma event edge detected");
         end
       endmodule
//Simulation log:
//20 trigger process_dma event
//20 process_dma event edge detected