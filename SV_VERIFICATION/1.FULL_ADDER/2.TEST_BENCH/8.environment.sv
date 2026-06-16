`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "reference.sv"
`include "interface.sv"

class  environment ;
  
   transaction tr;
   generator   gen;
   driver      driv;
   monitor     mon;
   score_board  sc;
   reference   re;

  
  mailbox #(transaction) gen_driv;
  mailbox #(transaction) gen_ref;
  mailbox #(transaction) ref_score;
  mailbox #(transaction) mon_score;
  
  virtual FA fd  ;
  event   d_done   ;
  
  
  function new (virtual FA fa);

    fd           = fa;
    gen_driv     =new();
    gen_ref      =new();
    ref_score    =new();
    mon_score    =new();
    
    gen          =new(gen_driv,gen_ref);
    driv         =new(gen_driv,fd,d_done);
    mon          =new(mon_score,fd,d_done);
    sc           =new(ref_score,mon_score);
    re           =new(gen_ref,ref_score,fd,d_done);
    
  endfunction
  
  task run();
    
    fork
      gen.doit;
      driv.doit;
      mon.doit;
      sc.doit;
      re.doit;
    join_any
    $display("PASS COUNT=%0d",sc.pass);
    $display("FAIL COUNT=%0d",sc.fail);
    #1;
    $finish;
    
  endtask
  
endclass: environment
