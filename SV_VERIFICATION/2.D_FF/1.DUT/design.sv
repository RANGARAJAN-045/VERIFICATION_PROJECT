// `include "interface.sv"
module dflip(dff fd );
  
  //input clk;
  always @ (posedge fd.clk)begin
    if (fd.rst)
      fd.q<=0;
    else
      fd.q<=fd.d;
  end 
endmodule
