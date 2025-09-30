// Basic example sequence that produces seq_item transactions

class basic_sequence extends uvm_sequence #(seq_item);
  `uvm_object_utils(basic_sequence)

  // TODO: Parameterize with knobs (num_items, randomization control, etc.)
  int unsigned num_items = 10;

  function new(string name = "basic_sequence");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_info(get_type_name(), $sformatf("Starting sequence with %0d items", num_items), UVM_MEDIUM)
    // Advance time to avoid all activity at t=0
    repeat (num_items) begin
      req = seq_item::type_id::create("req");
      // TODO: Randomize or fill fields as needed
      // if (!req.randomize()) `uvm_error(get_type_name(), "Randomization failed")

      start_item(req);
      // TODO: Optionally set fields before finish_item
      finish_item(req);
    end
  endtask : body
endclass : basic_sequence
