class driver;
  
  transaction tr;
  mailbox #(transaction) fromgen;
  virtual FA fd;
  event d_done;
  
  function new (mailbox #(transaction) fgen,virtual FA fs, event done);
    fromgen    = fgen;
    fd         = fs;
    d_done     = done;
  endfunction
  
  task doit();
    
    forever begin
      
      fromgen.get(tr);
      fd.a    = tr.a;
      fd.b    = tr.b;
      fd.cin  = tr.cin;
      $display("\n|-----------------------------------------|");
      $display("|_________-----___DRIVER__-----_____________|");
      $display("|-------------------------------------------|");
      $display("|--- at TIME = %0t THE INPUT HAS APPLIED ----|",$time);
      $display("|-------------------------------------------|");
      tr.display("DRIVER");
      
      #5;
      
      ->d_done;
    end
  endtask
endclass: driver
