class transaction;
  rand  bit a,b,cin;
  bit       sum,carry;
  
  function void display(string name);
    $display("\n|-----------------------------------------|");
    $display("|         NAME=%0s            |",name);
    $display("|-----------------------------------------|");
    $display("|      A = %b ------ B=%b ------ CIN = %b    |",a,b,cin);
    $display("|      SUM = %b || CARRY=%b                 |",sum,carry);
    $display("|-----------------------------------------|\n");
  endfunction
endclass: transaction
