# Vivado 2024.2 xsim projectless run script
# Supports batch and GUI. Generates waves and logs.

# Args via -tclargs: 
#   mode=batch|gui (default batch)
#   sim_time <time> (e.g., 1ms, 100us) for batch run bound
#   plusargs (e.g., +UVM_TESTNAME=base_test)

proc getopt {argv name default} {
  set idx [lsearch -exact $argv $name]
  if {$idx >= 0 && [expr {$idx+1}] < [llength $argv]} {return [lindex $argv [expr {$idx+1}]]}
  return $default
}

set argv_copy $argv
set mode [getopt $argv_copy mode batch]
set sim_time [getopt $argv_copy sim_time 1ms]

# Collect plusargs (anything starting with +)
set plusargs {}
foreach a $argv_copy { if {[string match "+*" $a]} { lappend plusargs $a } }

# Directories
set ROOT        [file normalize [file join [pwd] ..]]
set RUN_DIR     [file normalize [file join [pwd] sim]]
set LOG_DIR     [file normalize [file join [pwd] logs]]
file mkdir $RUN_DIR
file mkdir $LOG_DIR

# Filelist
set FILELIST [file normalize [file join [pwd] files.f]]
if {![file exists $FILELIST]} {
  puts "ERROR: files.f not found at $FILELIST"
  exit 1
}

# Read filelist
set files {}
set fh [open $FILELIST r]
while {[gets $fh line] >= 0} {
  set t [string trim $line]
  if {$t eq ""} {continue}
  if {[string match "#*" $t]} {continue}
  set full [file normalize [file join [pwd] $t]]
  lappend files $full
}
close $fh

cd $RUN_DIR

# Compile
puts "[clock format [clock seconds]]: Compiling (xvlog)..."
set opts [list xvlog -sv -L uvm -incr]
foreach f $files { lappend opts $f }
if {[catch {eval exec $opts} res]} {
  puts "ERROR during xvlog: $res"
  exit 1
}

# Elaborate
puts "[clock format [clock seconds]]: Elaborating (xelab)..."
set xelab_top work.top
set xelab_opts [list xelab $xelab_top -L uvm -debug typical -timescale 1ns/1ps]
if {[catch {eval exec $xelab_opts} res]} {
  puts "ERROR during xelab: $res"
  exit 1
}

# Run batch or GUI
if {$mode eq "batch"} {
  puts "[clock format [clock seconds]]: Running batch simulation..."
  # Enable wave dumping via TCL batch script
  set sim_tcl [file join $RUN_DIR run_batch.tcl]
  set fh2 [open $sim_tcl w]
  puts $fh2 "log_wave -recursive /*"
  puts $fh2 "run $sim_time"
  puts $fh2 "quit"
  close $fh2

  set plus ""
  if {[llength $plusargs] > 0} { set plus [join $plusargs { }] }
  set cmd [list xsim top -tclbatch $sim_tcl -wdb xsim.wdb]
  if {$plus ne ""} { lappend cmd --testplusarg "$plus" }
  if {[catch {exec -- {*}$cmd} res]} {
    puts "ERROR during xsim: $res"
    exit 1
  }
  puts "[clock format [clock seconds]]: Simulation finished. Wave: $RUN_DIR/xsim.wdb"
} else {
  puts "[clock format [clock seconds]]: Launching GUI..."
  # Generate GUI init script to add waves and run a bit
  set gui_tcl [file join $RUN_DIR run_gui.tcl]
  set fh3 [open $gui_tcl w]
  puts $fh3 "if {[file exists xsim.wdb]} { open_wave_database xsim.wdb }"
  puts $fh3 "log_wave -recursive /*"
  puts $fh3 "run 1000ns"
  close $fh3

  set plus ""
  if {[llength $plusargs] > 0} { set plus [join $plusargs { }] }
  set cmd [list xsim top -gui -tclinit $gui_tcl -wdb xsim.wdb]
  if {$plus ne ""} { lappend cmd --testplusarg "$plus" }
  puts "[clock format [clock seconds]]: Exec: [join $cmd { }]"
  exec -- {*}$cmd
}

exit 0
