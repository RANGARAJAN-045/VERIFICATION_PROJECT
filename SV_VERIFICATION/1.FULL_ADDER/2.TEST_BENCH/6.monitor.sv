class monitor;
  
  transaction tr;
  mailbox #(transaction) m2s;
  virtual FA fd;
  event d_done;
  
  function new(mailbox #(transaction) m2s,virtual FA fv, event d);
    
    this.m2s      = m2s;
    fd            = fv;
    d_done        = d;
    
  endfunction
  
  task doit();
    forever begin
      tr=new();
      //@(d_done);
      tr.a     = fd.a;
      tr.b     = fd.b;
      tr.cin   = fd.cin;
      #1;
      tr.sum   = fd.sum;
      tr.carry = fd.carry;
      tr.display("MONITOR");
      m2s.put(tr);
      #4;
    end
    
  endtask
  
endclass: monitor
