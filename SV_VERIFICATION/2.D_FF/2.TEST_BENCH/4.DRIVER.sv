class driver;
  
  transaction tr;
  mailbox #(transaction) fromgen;
  virtual dff fd;
  
  function new (mailbox #(transaction) fgen,virtual dff fs);
    fromgen    = fgen;
    fd         = fs;
  endfunction
  
  task doit();
    
    forever begin
      
      fromgen.get(tr);
      
      fd.blk.d      <= tr.d;
      fd.blk.rst    <= tr.rst;
      
      $display("\n|-----------------------------------------|");
      $display("|_________-----___DRIVER__-----_____________|");
      $display("|-------------------------------------------|");
      $display("|--- at TIME = %0t THE INPUT HAS APPLIED ----|",$time);
      $display("|-------------------------------------------|");
      tr.display("DRIVER");
      
//       #10;
      
    end
  endtask
endclass: driver

