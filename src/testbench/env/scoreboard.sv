// Scoreboard: receives observed transactions and checks vs expected

class scoreboard extends uvm_component;
  `uvm_component_utils(scoreboard)

  // Analysis export to connect from monitor
  uvm_analysis_imp #(seq_item, scoreboard) analysis_export;

  // TODO: Add reference model / predictor / expected queues

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_export = new("analysis_export", this);
  endfunction

  // write() gets called by the monitor via analysis_port
  virtual function void write(seq_item t);
    // TODO: Compare t against expected model; track pass/fail
    `uvm_info(get_type_name(), $sformatf("Observed: %s", t.convert2string()), UVM_LOW)
  endfunction
endclass : scoreboard

