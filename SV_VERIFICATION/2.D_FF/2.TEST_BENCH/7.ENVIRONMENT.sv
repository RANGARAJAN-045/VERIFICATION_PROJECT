`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "interface.sv"

class  environment ;
  
   transaction tr;
   generator   gen;
   driver      driv;
   monitor     mon;
   score_board  sc;

  
  mailbox #(transaction) gen_driv;
  mailbox #(transaction) mon_score;
  
  virtual dff fd  ;
  event   d_done   ;
  
  
  function new (virtual dff fa);

    fd           = fa;
    gen_driv     =new();
    mon_score    =new();
    
    gen          =new(gen_driv,fd);
    driv         =new(gen_driv,fd);
    mon          =new(mon_score,fd);
    sc           =new(mon_score);
    
  endfunction
  
  task run();
    
    fork
      gen.doit;
      driv.doit;
      mon.doit;
      sc.doit;
    join_any
    $display("PASS COUNT=%0d",sc.pass);
    $display("FAIL COUNT=%0d",sc.fail);
    #1;
    $finish;
    
  endtask
  
endclass: environment

