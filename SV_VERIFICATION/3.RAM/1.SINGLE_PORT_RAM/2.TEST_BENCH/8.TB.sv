`include "environment.sv"

// `include "interface.sv"
module tb();
  
  reg   clk=0;
  
  always #5 clk=~clk;
  
  inf         fd(clk);
  environment env;
  
  ram__sp dut (fd);
  
  initial begin
    
    env  = new(fd);
    env.run;
    
    
  end
    
endmodule
