class transaction;
  
  rand  reg [3:0]   data_in;
  rand  bit         rw;
  rand  reg [1:0]  address;
  logic     [3:0]   data_out;
  
  
  function void display(string name);
    
    $display("----------------------------------------------------------------------------");
    $display("| BLOCK      | TIME | ADDR | RW    | DIN  | DOUT       | ");
    $display("----------------------------------------------------------------------------");
    $display("| %-10s | %4t | %4h | %-5s | %4h | %4h |",name,$time,address,rw ? "READ":"WRITE",data_in,data_out);

//     $display("\n|-----------------------------------------|");
//     $display("|         %0s                      |",name);
//     $display("|-----------------------------------------|");
//     $display("|      D = %b ---------- RST = %b           |",d,rst);
//     $display("|             q=%b                         |",q);
//     $display("|-----------------------------------------|\n");
  endfunction
  
endclass: transaction
