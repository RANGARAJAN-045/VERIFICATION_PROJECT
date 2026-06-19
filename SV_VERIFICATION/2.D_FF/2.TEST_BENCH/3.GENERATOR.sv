class  generator;
  
  transaction tr1;
  mailbox #(transaction) todriver;
  virtual dff df;
  
  function new(mailbox #(transaction) td,virtual dff df);
    
    todriver  =  td;
    this.df   =  df;
    
  endfunction
  
  task doit;
    repeat(100) begin
      
      tr1=new();
      @(df.blk)
      void'(tr1.randomize());
      tr1.display("GENERATOR");
      todriver.put(tr1);
      
      #5;
      
    end
  endtask
endclass: generator 
