module ram__sp(inf fd);
  
  reg [3:0] memo [0:4];
  
  always@(posedge fd.clk)begin
    if (fd.rw)begin
      fd.data_out<=memo[fd.address];
    end
    else begin
      memo[fd.address]<=fd.data_in;
    end
  end
  
endmodule
