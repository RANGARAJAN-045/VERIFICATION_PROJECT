class  generator;
  
  transaction tr1,tr2;
  mailbox #(transaction) todriver;
  mailbox #(transaction) toref;
  
  function new(mailbox #(transaction) td,mailbox #(transaction) tref);
    
    todriver  =  td;
    toref     =  tref;
    
  endfunction
  
  task doit;
    repeat(30) begin
      tr1=new();
      //tr2=new();
      void'(tr1.randomize());
     // tr2.a    = tr1.a;
     // tr2.b    = tr2.b;
      //tr2.cin  =tr1.cin;
      tr1.display("GENERATOR");
      todriver.put(tr1);
      toref.put(tr1);
      
      #5;
      
    end
  endtask
endclass: generator 
