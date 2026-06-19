interface dff(input logic clk);
  logic rst,d;
  logic q;
  
  clocking blk @(posedge  clk);
    
    default input #1step output #0;
    
    output rst,d;
    input  q;
    
  endclocking
  
endinterface
