class score_board;
  
  reg   [3:0]  memo [0:31];
  logic [3:0]  expected_data_out;
  
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
      
      if (tr.rw)begin
        
        expected_data_out<=memo[tr.address];
        
      end
      else begin
        
        memo[tr.address]<=tr.data_in;
      end
      
      $display("---------------------------------------------");
      $display("|         THE OUTPUT CHECKING STARTS        |",$time);
      $display("|-------------------------------------------|\n");
      if(expected_data_out === tr.data_out)begin
        	$display("Expected = %b actual= %b",expected_data_out, tr.data_out);
          pass++;
          $display("---------------------------------------------");
          $display("|             CHECKING THE OUTPUT           |");
          $display("---------------------------------------------");
          $display("|     AT TIME=%0t  THE TEST IS SUCCESS      |",$time);
          $display("|-------------------------------------------|\n");
        end
        
        else begin
          fail++;
          $display("Expected = %b actual= %b",expected_data_out, tr.data_out);
          $display("---------------------------------------------");
          $display("|             CHECKING THE OUTPUT           |");
          $display("---------------------------------------------");
          $display("|     AT TIME=%0t  THE TEST HAS FAILED      |",$time);
          $display("|-------------------------------------------|\n");
          
        end
    end
    
  endtask
  
endclass: score_board
