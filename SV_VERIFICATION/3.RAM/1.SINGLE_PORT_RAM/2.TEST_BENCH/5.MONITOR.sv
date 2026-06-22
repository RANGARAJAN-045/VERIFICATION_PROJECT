class monitor;
  
  transaction tr;
  mailbox #(transaction) m2s;
  virtual inf fd;
  
  function new(mailbox #(transaction) m2s,virtual inf fv);
    
    this.m2s      = m2s;
    fd            = fv;
    
  endfunction
  
  task doit();
    forever begin
      
      tr=new();
      @(fd.blk);
      #1;
      tr.data_in = fd.data_in;
      tr.rw      = fd.rw;
      tr.address = fd.address;
      tr.data_out= fd.data_out;
      m2s.put(tr);
      tr.display("MONITOR");
//       #4;
    end
    
  endtask
  
endclass: monitor
