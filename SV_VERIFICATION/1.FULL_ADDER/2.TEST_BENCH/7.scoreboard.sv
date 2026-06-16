class score_board;
  
  transaction tr1,tr2;
  mailbox #(transaction) fromref;
  mailbox #(transaction) frommon;
  int pass,fail;
  
  function new(mailbox #(transaction) fref,mailbox #(transaction) fmon);
    
    fromref     =  fref;
    frommon     =  fmon;
    
  endfunction
  
  task doit;
    forever begin
      
      tr1=new();
      tr2=new();
      
      fromref.get(tr1);
      frommon.get(tr2);
    
      if(tr1.sum == tr2.sum  && tr1.carry == tr2.carry)begin
        pass++;
        $display("---------------------------------------------------");
        $display(" THE TEST CASE PASSED AND EVERYTHING IS CORRECTTTTT");
        $display("---------------------------------------------------");
      end
      else begin
        fail++;
        $display("---------------------------------------------------");
        $display(" THE TEST CASE FAILED AND THERE IS SOMETHING WRONG ");
        $display("---------------------------------------------------");
      end
    end
    
  endtask
  
endclass: score_board
