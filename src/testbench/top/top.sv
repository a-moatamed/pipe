// Simple top-level. Instantiates DUT (to be added) and kicks off UVM.

`timescale 1ns/1ps

import uvm_pkg::*;
import uvm_tb_pkg::*;

module top;
  // Clock/reset and interface
  logic clk; logic rst_n;
  my_if tb_if(.clk(clk), .rst_n(rst_n));

  // TODO: Instantiate DUT when available under ./src/rtl
  // dut u_dut(
  //   .clk(clk), .rst_n(rst_n),
  //   // ... connect to tb_if signals
  // );

  // Clock/reset gen (example placeholder)
  initial clk = 0; always #5 clk = ~clk;
  initial begin rst_n = 0; #50 rst_n = 1; end

  // Make virtual interface(s) available via UVM config DB
  initial begin
    // Provide single interface without modports
    uvm_config_db#(virtual my_if)::set(null, "*", "vif", tb_if);
  end

  // Kick off UVM
  initial begin
    `uvm_info("TOP", "SIMULATION STARTED", UVM_NONE)
    fork
        begin
            run_test("base_test"); // +UVM_TESTNAME=base_test can override
        end
        begin
            #1000;
            `uvm_fatal("SIM_END", $psprintf("Reached the simulation limi"))
        end
    join_any

  end
endmodule : top
