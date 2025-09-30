UVM Functional Verification Template (Vivado 2024.2)

Structure
- src/testbench/uvm_pkg/uvm_tb_pkg.sv        — central package importing all TB files
- src/testbench/sequences/seq_item.sv         — sequence item (transaction)
- src/testbench/sequences/sequence.sv         — basic example sequence
- src/testbench/agents/seqr.sv                — sequencer
- src/testbench/agents/driver.sv              — driver
- src/testbench/agents/monitor.sv             — monitor
- src/testbench/agents/agent.sv               — agent (active/passive)
- src/testbench/env/scoreboard.sv             — scoreboard (analysis export)
- src/testbench/env/env.sv                    — environment (connects agent, scoreboard)
- src/testbench/top/top.sv                    — top module (testbench top)
- src/testbench/top/test.sv                   — example UVM test

Notes
- Files include TODO comments where students should add project-specific code.
- Assumes a DUT will be added later under ./src/rtl and connected in top.sv.
- Designed to work with Vivado 2024.2 SystemVerilog + UVM.
