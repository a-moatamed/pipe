Functional Verification UVM Template (Vivado 2024.2)

**======== Do not remove! ========** 

Team name:

Member#1: John Doe<br>
Member#2: John Doe<br>
Member#3: John Doe<br>

**================================**

Overview
- Masters-level teaching template for UVM-based functional verification.
- Clean, minimal scaffold with environment, agent (sequencer/driver/monitor), scoreboard, sequence item/sequence, and a simple top.
- Ready to extend for labs, assignments, and projects.

Directory Structure
- src/testbench
  - if/my_if.sv — simple interface (clk, rst_n, basic handshakes)
  - sequences/seq_item.sv — UVM sequence item (TODO fields/constraints)
  - sequences/sequence.sv — Basic example sequence body (with #1 time advance)
  - agents/seqr.sv — UVM sequencer
  - agents/driver.sv — UVM driver (gets vif via config DB; #1 inside forever)
  - agents/monitor.sv — UVM monitor (analysis_port; #1 inside forever)
  - agents/agent.sv — Agent (active/passive), connects sequencer<->driver
  - env/scoreboard.sv — Scoreboard with analysis_export
  - env/env.sv — Environment wiring monitor->scoreboard
  - uvm_pkg/uvm_tb_pkg.sv — Central package importing the TB components
  - top/test.sv — Example UVM test starting a basic sequence
  - top/top.sv — Top module, clocks/reset, config DB, run_test()
- run
  - files.f — File list (compile interface first, then pkg, then top)
  - run_sim.tcl — Vivado/xsim projectless compile/elab/run (batch/GUI)
  - run.sh — Wrapper script with logging and safety

Requirements
- Vivado 2024.2 with xsim and UVM library available.
- SystemVerilog enabled (-sv) and UVM (-L uvm) in the flow.

Quick Start
1) Batch simulation (default 1 ms):
   - ./run/run.sh --clean
   - ./run/run.sh
2) Choose test:
   - ./run/run.sh +UVM_TESTNAME=base_test
3) Shorter/longer run time:
   - ./run/run.sh --time 100us
4) GUI (replay/open waves):
   - ./run/run.sh --gui

Artifacts
- Logs: run/logs/sim.log (also copied to vivado.log)
- Wave DB: run/sim/xsim.wdb (loaded in GUI if present)

Customization Tips
- Add your DUT under src/rtl and include it in run/files.f.
- Edit my_if.sv signals to match your protocol. No clocking blocks/modports used.
- Bind vif in top.sv (already done via uvm_config_db to "*").
- Implement transaction fields/constraints in sequences/seq_item.sv.
- Implement driver/monitor protocol logic in agents/driver.sv and agents/monitor.sv.
- Implement checking/expected model in env/scoreboard.sv.

Notes on Simulation Behavior
- Small #1 delays are placed inside forever loops (driver/monitor) and at the start of sequence body to avoid time-0 hangs and improve waveform readability.
- Batch runs are time-bounded (default 1 ms). Override with --time argument.
- run.sh restores terminal TTY settings on exit, even if interrupted.

Next Steps
- Add DUT stub and connect to my_if for a full end-to-end example.
- Extend with additional agents/environments as labs progress.

Modules
- AXI-Stream FIFO
- AXI4-Stream Broadcaster
- AXI4-Stream Clock Converter
- AXI4-Stream Combiner
- AXI4-Stream Data FIFO
- AXI4-Stream Data Width Converter
- AXI4-Stream Register Slice
- AXI Data FIFO
- AXI Data Width Converter
- AXI Register Slice
- Multiply Adder
- Accumulator
- Binary Counter
- AXI Interrupt Controller
- AXI Quad SPI
- AXI Timebase Watchdog Timer
- AXI Timer
- AXI UART16550
- AXI Uartlite
- AXI BRAM Controller
- Adder/Subtracter
- Floating-point
- CORDIC