// Basic sequence item (transaction)

class seq_item extends uvm_sequence_item;
  `uvm_object_utils(seq_item)

  // TODO: Declare transaction fields, e.g. addr, data, op, etc.
  // rand bit [31:0] addr;
  // rand bit [31:0] data;
  // rand bit        write;

  // TODO: Add constraints for valid transactions
  // constraint c_default { /* add constraints */ }

  function new(string name = "seq_item");
    super.new(name);
  endfunction

  // TODO: Implement do_copy if custom deep copy is needed
  // virtual function void do_copy(uvm_object rhs);
  //   seq_item rhs_; if(!$cast(rhs_, rhs)) `uvm_fatal(get_name(), "cast failed")
  //   super.do_copy(rhs);
  //   // copy fields
  // endfunction

  // TODO: Implement do_compare for scoreboarding if needed
  // virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  //   seq_item rhs_; if(!$cast(rhs_, rhs)) return 0;
  //   do_compare = super.do_compare(rhs, comparer);
  //   // compare fields
  // endfunction

  // Optional: pretty printing
  function string convert2string();
    // TODO: customize as needed
    return $sformatf("seq_item()");
  endfunction
endclass : seq_item

