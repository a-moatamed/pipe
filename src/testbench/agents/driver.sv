// Driver: pulls seq_item from sequencer and drives DUT interface

class my_driver extends uvm_driver #(seq_item);
  `uvm_component_utils(my_driver)

  // TODO: Add virtual interface handle(s) to drive DUT pins
  virtual my_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  // Get interface via config DB
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual my_if)::get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "virtual interface not set for driver")
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      // Advance time in loop to avoid zero-time deadlock
      seq_item req;
      seq_item rsp;
      seq_item_port.get_next_item(req);

      // TODO: Drive DUT using req fields via vif
      // Example simple valid/ready handshake (no clocking block)
      // @(posedge vif.clk);
      // vif.addr  <= req.addr;
      // vif.wdata <= req.data;
      // vif.write <= req.write;
      // vif.valid <= 1'b1;
      // do @(posedge vif.clk); while (!vif.ready);
      // vif.valid <= 1'b0;

      seq_item_port.item_done();
      #1; // TODO: remove once the task is implemented and consumes simulation time
    end
  endtask : run_phase
endclass : my_driver
