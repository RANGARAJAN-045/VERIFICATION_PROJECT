interface inf(input logic clk);
 
  logic [3:0]   data_in;
  logic         rw;
  logic [1:0]   address;
  logic [3:0]   data_out;
  
  clocking blk @(posedge  clk);
    
    default input #1step output #0;
    
    output data_in,rw,address;
    input  data_out;
    
  endclocking
  
endinterface
