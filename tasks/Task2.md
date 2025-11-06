Task 2. Deadlines: Nov 11 / Nov 18

- Get familiar with UVM reporting functions and UVM phases
- Implement one or more sequence items
- Implement one or more sequences
- Implement a base test generating simple sequences
- Update the driver to get and print the sequence items
- Get familiar with randomization and contraints
- Run a simulation to confirm that everything works

You should begin by reviewing this week’s source code (the one we discussed during the lab) to understand how data flows through the testbench and how the different UVM components interact.

After that, take some time to plan your own setup. You don’t necessarily need to reuse the same seq_item, sequence, or other components from the lab example (where we focused on generating register accesses). Instead, think about the interfaces your module provides and decide which agents you’ll need. Based on that, determine what seq_item, sequence, and related classes are required for your design.

For now, create only a simple test to verify that everything you’ve implemented so far works correctly. The tests will become more complex later, once you have more functionality in your design.