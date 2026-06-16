`include "environment.sv"

module tb();
  
  FA         fd();
  environment env;
  
  full_ad dut (fd);
  
  initial begin
    
    env  = new(fd);
    env.run;
    
    
  end
    
endmodule
