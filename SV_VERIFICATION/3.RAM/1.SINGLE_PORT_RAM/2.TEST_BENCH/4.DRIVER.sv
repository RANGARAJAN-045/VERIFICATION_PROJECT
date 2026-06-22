class driver;
  
  transaction tr;
  mailbox #(transaction) fromgen;
  virtual inf fd;
  
  function new (mailbox #(transaction) fgen,virtual inf fs);
    fromgen    = fgen;
    fd         = fs;
  endfunction
  
  task doit();
    
    forever begin
      
      fromgen.get(tr);
      @(fd.blk);
      
      fd.data_in = tr.data_in;
      fd.rw      = tr.rw;
      fd.address = tr.address;
      $display("the value of out  = %d",tr.data_out);
      tr.display("DRIVER");
      
    end
  endtask
endclass: driver
