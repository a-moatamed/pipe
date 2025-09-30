// Monitor: samples DUT interface and publishes transactions via analysis_port

class my_monitor extends uvm_component;
  `uvm_component_utils(my_monitor)

  // TODO: Add virtual interface handle(s) to observe DUT pins
  virtual my_if vif;

  uvm_analysis_port #(seq_item) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ap = new("ap", this);
    if (!uvm_config_db#(virtual my_if)::get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "virtual interface not set for monitor")
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      // TODO: Sample protocol and build item
      seq_item tr = seq_item::type_id::create("tr");
      // @(posedge vif.clk);
      // tr.addr  = vif.addr;
      // tr.data  = vif.write ? vif.wdata : vif.rdata;
      // tr.write = vif.write;
      // ap.write(tr);
      #1; // TODO: remove once the task is implemented and consumes simulation time
    end
  endtask : run_phase
endclass : my_monitor
