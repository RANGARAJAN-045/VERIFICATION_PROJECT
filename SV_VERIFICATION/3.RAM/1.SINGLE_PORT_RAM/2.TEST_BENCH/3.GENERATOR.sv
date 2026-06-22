class  generator;
  
  transaction tr1;
  mailbox #(transaction) todriver;
  virtual inf df;
  
  function new(mailbox #(transaction) td,virtual inf df);
    
    todriver  =  td;
    this.df   =  df;
    
  endfunction
  
  task doit;
    repeat(150) begin
      
      tr1=new();
      @(df.blk)
      void'(tr1.randomize());
      tr1.display("GENERATOR");
      todriver.put(tr1);
      
    end
  endtask
endclass: generator 
