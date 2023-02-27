---
date: 2021-07-19T00:00:00Z
title: What You Need to Know About Verilator Open Source Tooling
categories:
  - Blog
author: Rob Mains, General Manager of CHIPS Alliance
images: ['images/blog-share.jpg']
aliases: ['/blog/2021/07/19/what-you-need-to-know-about-verilator-open-source-tooling/']
---

Verilator is a high performance, open source functional simulator that has gained tremendous popularity in its usage and adoption in the verification of chip design. The ASIC development community has widely embraced Verilator as an effective, often even superior alternative to proprietary solutions, and it is now the standard approach in RISC-V CPU design as the community has worked to provide Verilator simulation capabilities out of the box. CHIPS Alliance and RISC-V leaders Antmicro and Western Digital have been collaborating to make Verilator even more useful for ASIC design purposes, working towards supporting industry-standard verification methods in a completely open source flow.

On June 15 at the inaugural CHIPS Alliance Deep Dive Cafe Talk, Karol Gugala, an engineering manager with Antmicro, provided an excellent in-depth technical talk on extending Verilator towards supporting universal verification methodology, UVM. The event was well attended, and is now also available on [YouTube](https://www.youtube.com/watch?v=s7ivKvXGS74&list=PLWm-dtUGVJtAdqvG2Kk-FemLyCTLmCIoT).

{{< youtube s7ivKvXGS74 >}}

Karol started the talk by providing motivation for the improvement and expansion of the System Verilog design environment, and in particular the importance of UVM to offer a common verification framework. He covered the current limitations of Verilator relative to its handling of UVM, and the goal of the community to more robustly support UVM and also System-Verilog as a design language, both of which are efforts Antmicro is deeply involved with as part of its work within CHIPS Alliance with other CHIPS partners. In the talk, Karol provided in-depth details of work that has been done to handle UVM.

The focus of the work summarized by Karol’s talk was the comparison of static event scheduling already existent in Verilator to dynamic scheduling which is required for event driven simulation, specifically event and time awareness. This necessitated a new event scheduling approach in Verilator to be implemented. The new scheduler is an option that the user can activate as a runtime switch. Future work includes: clocking blocks, assertions, assertions, class parameters, integration with UHDM, and further runtime optimization. Full UVM support for the SweRV RISC-V cores and OpenTitan – also based on a RISC-V implementation, [Ibex](https://github.com/lowRISC/ibex) – are two key goals. A detailed overview of how System Verilog statements are evaluated as members of different processes was provided. As an initial implementation, each process now runs in a separate thread, with processes and threads communicating via standard IPC synchronization protocols. Scheduling of the threads / processes is left to the OS scheduler, and further work in the project will include more involved scheduling techniques.

You can read more about dynamic scheduling in Verilator at Antmicro’s [blog](https://antmicro.com/blog/2021/05/dynamic-scheduling-in-verilator), and test all the new features of Verilator with examples of designs and some GitHub Actions-based CI simulations (based on Antmicro’s public [repo](https://github.com/antmicro/verilator-dynamic-scheduler-examples)).

The next talk in the CHIPS Deep Dive Cafe Series is the AIB Deep Dive + Opportunities Presented By Intel on Tuesday, Aug. 10 at 8 a.m. PT. You can register for the event [here](https://linuxfoundation.org/webinars/chips-alliance-deep-dive-cafe-talks-aib-deep-dive-opportunities/).