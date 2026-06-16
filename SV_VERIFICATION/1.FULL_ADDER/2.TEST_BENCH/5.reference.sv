class reference;
  
  bit sum,carry;
  
  transaction tr;
  mailbox #(transaction) gen_to_ref;
  mailbox #(transaction) ref_to_score;
  virtual FA fd;
  event d_done;
  
  function new(mailbox #(transaction) g_f,mailbox #(transaction) r_e,virtual FA fs,event d);
    
    gen_to_ref    = g_f;
    ref_to_score  = r_e;
    fd            = fs;
    d_done        = d;
    
  endfunction
  
  task doit();
    forever begin
      tr=new();
      gen_to_ref.get(tr);
    //@(d_done);
      {carry,sum}=tr.a+tr.b+tr.cin;
      tr.carry = carry;
      tr.sum   = sum;
    //tr.carry = carry;
      tr.display("REFERENCE");
      ref_to_score.put(tr);
      #5;
    end
    
  endtask
endclass: reference
