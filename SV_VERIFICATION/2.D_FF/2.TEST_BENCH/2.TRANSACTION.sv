class transaction;
  rand  bit d,rst;
  bit       q;
//   constraint re {rst dist{0:=5, 1:=1};}
  
  function void display(string name);
    $display("\n|-----------------------------------------|");
    $display("|         %0s                |",name);
    $display("|-----------------------------------------|");
    $display("|      D = %b ---------- RST = %b         |",d,rst);
    $display("|             q=%b                        |",q);
    $display("|-----------------------------------------|\n");
  endfunction
endclass: transaction
