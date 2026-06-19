class monitor;
  
  transaction tr;
  mailbox #(transaction) m2s;
  virtual dff fd;
  
  function new(mailbox #(transaction) m2s,virtual dff fv);
    
    this.m2s      = m2s;
    fd            = fv;
    
  endfunction
  
  task doit();
    forever begin
      tr=new();
      @(fd.clk);
      #1;
      tr.rst     = fd.rst;
      tr. d      = fd.d;
      #1;
      tr.q       = fd.q;
      m2s.put(tr);
      tr.display("MONITOR");
      $display("d=%b rst=%b q=%b",fd.d,fd.rst,fd.q);
      
      
       #7;
    end
    
  endtask
  
endclass: monitor

