class score_board;
  
  bit expected_q;
  
  transaction tr;
  mailbox #(transaction) frommon;
  int pass,fail;
  
  function new(mailbox #(transaction) fmon);
    
    frommon     =  fmon;
    
  endfunction
  
  task doit;
    forever begin
      
      tr=new();
      frommon.get(tr);
      
      if (tr.rst)
         expected_q<=0;
      else
        expected_q<=tr.d;
      
      if(tr.rst == 1)begin
        $display("---------------------------------------------");
        $display("|             CHECKING THE RESET            |");
        $display("---------------------------------------------");
        $display("|     AT TIME=%0t  THE RESET HAS APPLIED    |",$time);
        $display("|-------------------------------------------|\n");
        
        if(tr.q == 0)begin
          $display("---------------------------------------------");
          $display("|     AT TIME=%0t  THE RESET HAS PASSSED    |",$time);
          $display("|-------------------------------------------|\n");
        end
        else begin
          
          $display("---------------------------------------------");
          $display("|     AT TIME=%0t  THE RESET HAS PASSSED    |",$time);
          $display("|-------------------------------------------|\n");
        end
      end
      
      else begin
        
        $display("---------------------------------------------");
        $display("|         THE OUTPUT CHECKING STARTS        |",$time);
        $display("|-------------------------------------------|\n");
        if(expected_q == tr.q)begin
          pass++;
          $display("---------------------------------------------");
          $display("|             CHECKING THE OUTPUT           |");
          $display("---------------------------------------------");
          $display("|     AT TIME=%0t  THE TEST IS SUCCESS      |",$time);
          $display("|-------------------------------------------|\n");
        end
        
        else begin
          fail++;
          $display("---------------------------------------------");
          $display("|             CHECKING THE OUTPUT           |");
          $display("---------------------------------------------");
          $display("|     AT TIME=%0t  THE TEST HAS FAILED      |",$time);
          $display("|-------------------------------------------|\n");
          
      end
        
      
  end 
      
      
    end
    
  endtask
  
endclass: score_board

