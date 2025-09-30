Vivado 2024.2 Simulation Scripts

Overview
- `run_sim.tcl` — main Tcl that configures projectless xsim flow, compiles RTL/TB, runs batch or launches GUI, and enables waves.
- `run.sh` — convenience wrapper to invoke Vivado in batch or GUI, with logging to terminal and file.
- `files.f` — filelist placeholder. Add your RTL and TB file paths here.

Usage
- Batch (default):
  `./run/run.sh`
- GUI (replay last run, open waves):
  `./run/run.sh --gui`
- Clean artifacts:
  `./run/run.sh --clean`
- Specify test:
  `./run/run.sh +UVM_TESTNAME=base_test`

Notes
- The script assumes UVM is available with xsim (`-uvm`).
- Wave database saved as `./run/sim/xsim.wdb`. The GUI mode opens it if available.
- Logs are printed to terminal and saved to `./run/logs/vivado.log` and `./run/logs/sim.log`.
