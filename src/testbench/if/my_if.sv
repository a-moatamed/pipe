// Generic bus-like interface template with clocking and modports
`timescale 1ns/1ps

interface my_if(
  input  logic clk,
  input  logic rst_n
);
  // TODO: Customize signal list for your DUT protocol
  logic        valid;
  logic        ready;
  logic [31:0] addr;
  logic [31:0] wdata;
  logic [31:0] rdata;
  logic        write; // 1=write, 0=read

  // Simple interface without clocking blocks or modports.

  // Synchronous reset default
  // TODO: Adjust reset behavior to match DUT
  // property p_reset_defaults;
  //   @(posedge clk) !rst_n |-> (!valid && !write);
  // endproperty
  // a_reset_defaults: assert property (p_reset_defaults);

  // No modports used in the simplified template.

endinterface : my_if
