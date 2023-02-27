---
date: 2020-07-10T00:00:00Z
title: CHIPS SweRV Cores and the Open Tools Ecosystem
categories:
  - Blog
author:
images: ['images/blog-share.jpg']
aliases: ['/blog/2020/07/10/chips-swerv-cores-and-the-open-tools-ecosystem']
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2020/07/swerv-cores-tools-ecosystem/).*

Antmicro’s open source work spans all parts of the computing stack, from software and AI, to PCBs, FPGAs and, most recently, custom silicon. We connect those areas with an overarching vision of open source tooling and methodology, and a software-driven approach that allows us to move fast and build future-centric solutions. Our partners and customers, many of whom work with us also in the context of organizations such as [CHIPS Alliance](https://chipsalliance.org/) and [RISC-V](https://riscv.org/), share our approach to developing open systems. We were recently very happy to be invited to give a talk at the [“Production grade, open RISC-V SweRV Core Solutions in CHIPS Alliance”](https://www.youtube.com/watch?v=ODU1b9amCG8&feature=emb_title) meetup organized by Western Digital where we presented our systems approach on the example of the open source tools ecosystem that targets their SweRV cores and which we are helping to develop.

## What is SweRV?

[SweRV](https://github.com/chipsalliance/Cores-SweRV) is a family of production-grade RISC-V implementations originally developed by Western Digital, who have announced they are going to transition 2 billion cores in their products to RISC-V, showing they are fully committed to this open processor architecture. SweRV comes in three variants: the original EH1 and the recently released [EH2 and EL2](https://chipsalliance.org/news/newly-enhanced-swerv-cores/).

EH2 is the world’s first dual-threaded commercial, embedded RISC-V core designed for IoT and AI systems, boasting as much as 6.3 CoreMark/MHz in dual-threaded mode, at 1.2 GHz in 16nm. EL2, on the other hand, is a tiny, low-power but high-performance RISC-V core (with just 0.023 mm2 in 16nm, it runs at up to 600 MHz and 3.6 CoreMark/MHz) targeting applications such as state-machine sequencers and waveform generators. The best thing about them is that anybody can use and extend them for free, with more high performance cores being planned in the future.

But a CPU is as good as the tooling around it and Western Digital knows it. That is why the entire SweRV family was handed over to CHIPS Alliance, which now aims to facilitate using the cores in practical scenarios by maintaining the dynamic ecosystem of relevant tools. Many of the necessary building blocks are already in place, while others are still being developed with active participation of Antmicro, the [FOSSi](https://fossi-foundation.org/) community and others. In this article you will see examples of how you can work with SweRV in simulation, on an FPGA and in an ASIC context.

## Getting started

To get started very quickly with no hardware whatsoever, you can simulate any of the SweRV cores in [Verilator](https://github.com/verilator/verilator) – one of the most successful and widely used open source projects in the EDA space, which we use extensively. Simply, go to the relevant core’s GitHub space in the CHIPS Alliance organization (e.g. https://github.com/chipsalliance/Cores-SweRV for EH1) and simulate the RTL (which is written in SystemVerilog).

Verilator simulates the RTL with high performance by compiling to an optimized model and running it, outperforming many proprietary alternatives. What is more, it is developing very fast thanks to the work of its maintainer – Wilson Snyder, the FOSSI community and CHIPS Alliance. Antmicro specifically has been working together with Western Digital and Google on adding support for SystemVerilog / Universal Verification Methodology to enable Verilator’s design verification for real-world use cases (see Looking into the future below).

## Putting SweRV into an FPGA

If you want to get working on something more tangible, you might want to run SweRV on an FPGA – in a portable, vendor-neutral manner, of course.

To simplify interfacing with various toolchains, simulators and other tools you might need depending on the platform you want to target, you can use [Edalize](https://github.com/olofk/edalize) – a Python utility that allows you to seamlessly work with different kinds of EDA tools, both for FPGA and ASIC design. It helps you to maintain consistent workflows and pinpoint whether a specific bug is tool-related or pertains to your code. We’ve been adding quite a lot of new functionalities into Edalize recently, while using it heavily as a default way to interface with various tools out there in our work e.g. sv-tests (again, see Looking into the future for more on that topic).

Edalize will help you use your SweRV-based design on the FPGA/board of your choice without having to care about remembering and maintaining specific configurations and runtime flags.

Another great tool from the same author is [FuseSoC](https://github.com/olofk/fusesoc), a Python-based package manager and a set of build tools for HDL code. It enables you to reuse your FPGA IP across many designs and, of course, it supports SweRV cores well. Apart from making it simple to reuse existing cores, it allows you to easily create compile-time or run-time configurations, port designs to new targets, set up configurable Continuous Integration as well as let other projects use your code. FuseSoC is also used by the [SweRVolf SoC](https://github.com/chipsalliance/Cores-SweRVolf).

Thanks to integrations with other open source tools like Google’s [Verible linter/formatter](https://github.com/google/verible), that we’re also helping to develop, FuseSoC can be used to lint and format System Verilog – we have recently written [an article](https://antmicro.com/blog/2020/04/systemverilog-linter-and-formatter-in-fusesoc/) about this.

## Incorporating SweRV into an SoC

A core alone, however, is not enough to get any practical work done. If you want to build a System-on-Chip, you should definitely look at [LiteX](https://github.com/enjoy-digital/litex) – a SoC generator that allows you to put SweRV in an actual use case. LiteX is an IP library and a SoC builder that is portable between various FPGAs and can turn SweRV into a full blown system. It has a number of IPs and other building blocks such as Ethernet, RAM, UART, SATA, etc. which you can configure to work with different kinds of CPUs. It has initial SweRV support which enables the user to quickly build plug & play SoC systems with SweRV. Antmicro is heavily involved in work to build a [robust ecosystem around it](https://github.com/litex-hub). LiteX can run the [Zephyr RTOS](https://www.zephyrproject.org/) – which is also supported on SweRV – and, with a suitable CPU, it can run Linux as well. The LiteX SoC ecosystem can also be used together with another tooling project we heavily contribute to, [SymbiFlow](https://symbiflow.github.io/) – the open source FPGA flow.

## Simulating, experimenting, testing

If you want to use SweRV to build a full production system and leverage the flexibility to customize that comes with the RISC-V and open tooling, you will most likely need to experiment with the architecture and co-develop hardware and software. This is where [Renode](https://renode.io/) can be of immense use thanks to its [architectural exploration](https://www.allaboutcircuits.com/industry-articles/decreasing-the-length-of-design-cycle-in-co-designed-socs-with-renode/), simulation, testing and debug capabilities for complex systems: entire SoCs, boards and systems of boards. All you need to do is download Renode and put together a few configuration files – it even comes with many [demos and pre-compiled examples for various platforms](https://renode.readthedocs.io/en/latest/introduction/supported-boards.html). Renode provides [initial support for SweRV EH1](https://github.com/antmicro/renode_swerv_eh1) (with more to come) as well as extensive support of LiteX, which will let you quickly build and simulate entire open source SoCs. On top of that, Renode enables [hardware/software co-simulation with Verilator](https://antmicro.com/blog/2019/09/renode-verilator-hdl-co-simulation/) for building your custom IP and testing its HDL as-is, while keeping the rest of the system simulated in Renode to save development time.

## Building and verifying a production-grade ASIC

Assuming SweRV fits your use case, you may eventually want to build and verify a production-grade ASIC which includes one of those CPUs. As part of the CHIPS working groups focused on cores and tools, the developers of SweRV in collaboration with Google, Antmicro and others are building an entirely open source design verification ecosystem around the cores family, including projects such as [riscv-dv](https://github.com/google/riscv-dv) and [Whisper ISS](https://github.com/westerndigitalcorporation/swerv-ISS). The former is an entire SV/UVM flow based on an instruction generator for RISC-V processor verification, which allows you to perform various tests on SweRV-based designs. It features a number of test suites dedicated to different functionalities. It runs ISS and RTL simulators in tandem and compares the results. Whisper ISS is a tool used for verification of SweRV implementations, which can be run in an interactive mode, allowing the user to single step RISC-V code and inspect/modify the RISC-V registers or system memory, or it can be run in lock-step, e.g. with Verilator.

## Looking into the future

There is ongoing work from CHIPS Alliance and the broader open source community to rapidly transform the ASIC-development workflows to fully embrace open source. One such effort is [sv-tests](https://github.com/SymbiFlow/sv-tests), a System Verilog test suite designed to stress-test different kinds of designs in SystemVerilog against various open source tools, showing a [results table](https://symbiflow.github.io/sv-tests/) indicating detailed coverage. SweRV, being written in SystemVerilog, is of course one of the suite’s test targets.

The SV test suite informs some of our ongoing open source work for ASIC tooling, one of the goals of which is to enable open source development and verification of System Verilog designs. An interesting tool to look at in this space is [Surelog](https://github.com/alainmarcel/Surelog) – a full-blown SystemVerilog parser developed in collaboration between Google and Antmicro oriented at simulation and UVM. We are working to plug it as the System Verilog front-end into various open source tools using a framework called [UHDM (Universal Hardware Data Model)](https://github.com/alainmarcel/UHDM), which will enable code reuse between various tools with similar needs.

With the recent release of [the world’s first open PDK](https://antmicro.com/blog/2020/06/skywater-open-source-pdk/), that we are proud to have been participating in, and the [progress being made in the OpenROAD project](https://youtu.be/1rfBK5KKzR0), which aims at a fully open flow for chip design and other areas, it looks like the future in which a SweRV based SoC can be designed, verified and manufactured using open tools is not that far off.

## Summary

Apart from being an expanding, production-grade family of cores, SweRV taps into a very good and dynamic ecosystem of tools that we are helping to build. CHIPS Alliance is aiming to revolutionize the way developers work with ASICs and FPGAs by enabling a software-driven approach to silicon, which perfectly aligns with Antmicro’s strategy and long-term objectives. With extensive experience in RISC-V-powered open source work, we offer high-quality services that our customers can use to build on top of SweRV using these new collaborative methodologies and tools. Reach out to Antmicro at contact@antmicro.com to find out how the company can assist you with your next RISC-V-centered project.