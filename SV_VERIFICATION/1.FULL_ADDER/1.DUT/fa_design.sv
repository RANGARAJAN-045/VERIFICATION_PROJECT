module full_ad (FA fd);
  
  always@(*)begin
    
    fd.sum    = fd.a ^ fd.b ^ fd.cin;
    //fd.carry  = (fd.a & fd.b) | fd.cin & (fd.a ^ fd.b);
    fd.carry=(fd.a&fd.b)|(fd.a&fd.cin)|(fd.cin&fd.b);
  end
  
endmodule
