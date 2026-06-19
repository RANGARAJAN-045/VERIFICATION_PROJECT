
`include "environment.sv"
// `include "interface.sv"
module tb();
  
  reg   clk=0;
  
  always #5 clk=~clk;
  
  dff         fd(clk);
  environment env;
  
  dflip dut (fd);
  
  initial begin
    
    env  = new(fd);
    env.run;
    
    
  end
    
endmodule
