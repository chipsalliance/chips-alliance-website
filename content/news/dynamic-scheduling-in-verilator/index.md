---
date: 2021-05-13T00:00:00Z
title: Dynamic Scheduling in Verilator – Milestone Towards Open Source UVM
categories:
  - Blog
author:
images: ['images/blog-share.jpg']
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2021/05/dynamic-scheduling-in-verilator/).*

UVM is a verification methodology traditionally used in chip design which has historically been missing from the open source landscape of verification-focused tooling. While new, open source approaches to verification have emerged that include the excellent Python-based Cocotb (that [we also use](https://antmicro.com/blog/2019/12/testing-usb-cores-with-python-and-cocotb/) [and support](https://antmicro.com/blog/2019/06/verilog-with-cocotb-and-verilator/)) maintained by [FOSSi Foundation](https://www.fossi-foundation.org/), not everyone can easily adopt it, especially in long-running projects and existing codebases that use a different verification approach. Leading the efforts towards comprehensive UVM / SystemVerilog support in open source tools, we have been gradually completing milestones, getting closer to what will essentially be a modular, collaboration-driven chips design methodology/workflow. Some examples of our activity in this space include [enabling open source synthesis and simulation of the Ibex CPU](https://antmicro.com/blog/2020/12/ibex-support-in-verilator-yosys-via-uhdm-surelog/) in [Verilator](https://github.com/antmicro/verilator/tree/uhdm-verilator)/[Yosys](https://github.com/antmicro/yosys/tree/uhdm-yosys) via UHDM/Surelog, and the most recent joint project with Western Digital in which we have developed [dynamic scheduling in Verilator](https://github.com/antmicro/verilator-dynamic-scheduler-examples).

## Verilating non-synthesizable code

The work is a part of a wider, long-term effort that, besides Western Digital, has involved other fellow CHIPS Alliance members such as Google, to develop UVM / SystemVerilog support in open source tools. To get closer to this goal, this time we have introduced an improvement to Verilator – an open source tool that is great at doing what it was originally designed to do, that is simulating synthesizable code, but hasn’t been enabling its users to convert non-synthesizable code and run fully fledged testbenches written in Verilog/SystemVerilog. The biggest challenge to opening that possibility turned out to be Verilator’s original scheduler running everything sequentially, which in general is not a bad approach but can get you only so far without actually executing the code in parallel.

![Dynamic scheduling in Verilator](dynamic-scheduling-verilator.png)

To run proper UVM testbenches in Verilator, we had to be able to properly handle language constructs specifically designed for use in simulation. Those features include delay statements, forks, wait statements and events. To achieve all of this, we needed to add a proof-of-concept dynamic scheduler to Verilator.

## How dynamic scheduling in Verilator works

Instead of grouping code blocks of the same type as the original scheduler does, the dynamic scheduler separates the code into many runnable blocks and then creates and spawns a process for each of them (when they are due to be executed). To deal with it we created a new process, which translates to a new high level thread for each initial block, always block, forever block, each block in the fork statement etc. This allows us to pause the execution of one block and continue the execution of other blocks. Blocks can be paused when they encounter simulation control statements like:

- The wait statement (e.g. `wait (rdy == 1);` or `wait (event_name.triggered)`)
- Waiting for an event (e.g `@event_name;`)
- A delay (`#10;`)
- Or even a join statement after fork (`join`, `join_any` – `join_none` is also supported, however it is not used to control the execution per se)

All of the statements listed above are not supported in Verilator’s original scheduler, so to be able to dynamically control the execution of those already dynamically spawned sub-processes, a way to react to changes in signal/events states needed to be implemented. We did it by wrapping the primitive types used for storing signal values in objects using higher abstraction levels, which now allows us to attach other processes to monitor values of specific signals and execute an arbitrary callback when a signal changes. Note that this is a mechanism used internally to implement the flow control statements and is not visible to the user writing Verilog code.

One additional thing that had to be re-written and adapted to the dynamic scheduler was the way non-blocking assignments are handled.

With a scheduler that is aware of the simulation time and other flow control statements, the same approach originally used by Verilator could not be applied anymore. A way to properly schedule assignments, and execute them in the proper moment was a crucial step in getting all of this to work.

Note that the features described above are the ones that are immediately visible to users of Verilator with the dynamic scheduler. This is however only the tip of the iceberg when it comes to the amount of internal changes needed to be done in Verilator.

## Example usage

To present the usage of all the new Verilator features we have created a public [GitHub repository](https://github.com/antmicro/verilator-dynamic-scheduler-examples) with a number of example designs and GitHub Actions-based CI simulating them.

The examples range from single feature examples to more complex scenarios simulating a system with two UARTs sending data between each other.

The [UART testbench example](https://github.com/antmicro/verilator-dynamic-scheduler-examples/tree/master/examples/uart) uses all the newly added features. It spawns a thread for every simulated UART block and each thread feeds the [UART IP](https://github.com/alexforencich/verilog-uart) that is being tested with the predefined data (the “hello world” string in our example).

The UART block reads the data from an AXI stream interface, serializes it and sends it over the TX line.

The received data is available on the output AXI Stream bus.

Each testbench thread introduces a random delay between consecutive data chunk transmission.

The threads are synchronized using SystemVerilog events – e.g. once the data is fed into the UART block over the AXI stream interface, a thread is triggering an event informing the other part of the thread that the data is being transmitted by the IP.
Once transmission is done, another event is triggered informing the first thread that the IP is ready for a new data chunk.

Once all the test data is transferred between both tested UART instances, the threads are joined and data correctness is validated.

## Next steps, future goals

This ongoing project is a big step towards UVM support in open tools as it not only removes a number of limitations in this area but also opens the door to future developments – which include a number of SystemVerilog features oriented towards verification which were earlier out of scope since open source UVM verification wasn’t on the horizon. Together with the effort to support SystemVerilog in Verilator using UHDM which is part of another ongoing project, in CHIPS Alliance we continue to work towards enabling open source design verification for everyone, which will revolutionize the way chips are built.