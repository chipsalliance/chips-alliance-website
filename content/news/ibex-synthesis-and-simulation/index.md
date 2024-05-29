---
date: 2021-01-07T00:00:00Z
title: Enabling Open Source Ibex Synthesis and Simulation in Verilator/Yosys via UHDM/Surelog
categories:
  - Blog
author:
images: ['images/blog-share.jpg']
aliases: ['/blog/2021/01/07/ibex-synthesis-and-simulation/']
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2020/12/ibex-support-in-verilator-yosys-via-uhdm-surelog/).*

Throughout 2020 we were hard at work developing proper, portable SystemVerilog support for multiple open-source FPGA and ASIC design tools used by us and our customers, most notably [Yosys](https://github.com/YosysHQ/yosys) and [Verilator](https://github.com/verilator/verilator). We strongly believe that the support is a necessary step in building a collaborative ecosystem and scalable and reproducible CIs, especially publicly accessible ones that are common in multi-organization projects such as [OpenTitan](https://opentitan.org/) and [CHIPS Alliance](https://chipsalliance.org/). Leading the efforts towards achieving this goal, we’ve been developing a fully open source SystemVerilog parsing flow for Yosys and Verilator using UHDM and Surelog, achieving an important milestone: being able to fully parse, synthesize and simulate OpenTitan’s Ibex core directly from the SystemVerilog source.

## Getting closer to open-source synthesis and simulation

In this effort, Antmicro has been gradually covering various SystemVerilog functionalities and real-world implementations, developing support for different open source RISC-V cores and moving closer to a complete open-source synthesis and simulation tools support for [Ibex](https://github.com/lowRISC/ibex) – a small and efficient, 32-bit, RISC-V core used in the OpenTitan project. Originally developed at ETH Zürich as RI5CY, it is now maintained and developed further by [lowRISC](https://www.lowrisc.org/) – a not-for-profit organization promoting collaborative engineering that targets open source silicon designs and tools.

![](Logos.svg)

## Open source SystemVerilog test suite

What has proved very helpful in this process is the [SystemVerilog test suite](https://github.com/SymbiFlow/sv-tests) that we developed last year and continue to maintain together with a broad open source community in order to keep track of the supported and missing SystemVerilog features in a number of Verilog tools. It runs tests dedicated to various tools classes, covering a range of features, from single SV functionalities up to complex designs.

Earlier this year, while closely tracking our progress using sv-tests, we have completed a number of milestones such as parsing Ibex in the Yosys synthesis tool directly or enabling SystemVerilog linting in formatting with Google’s [Verible](https://github.com/google/verible) SystemVerilog parser and [FuseSoC](https://github.com/olofk/fusesoc) an open source tooling and IP package manager that is easy to integrate with existing workflows. The results of this ongoing work are now being used in several open source silicon projects, most notably OpenTitan. You can find a demo integration on our GitHub [as described in dedicated blog note earlier this year](https://antmicro.com/blog/2020/04/systemverilog-linter-and-formatter-in-fusesoc/).

## Parsing CPU cores with a higher order tool

However, our overarching goal in this space was to enable parsing various complex SystemVerilog designs (with Ibex being the tip of the proverbial iceberg) with higher order tools which could be used as a front-end to multiple other tools, without the necessity to redo the work every time and to maintain SystemVerilog support in multiple tools.

![](Universal-hardware-data-model-outlines.svg)

This can be achieved with UHDM and Surelog – two open source tools originally developed by Alain Marcel. [UHDM](https://github.com/alainmarcel/UHDM) (Universal Hardware Data Model) is a multi-purpose intermediate library that enables plugging a parser into many different tools, while Surelog is a versatile, comprehensive SystemVerilog parser, pre-processor, elaborator and UHDM compiler.

Adding enough coverage of SystemVerilog in UHDM/Surelog to support the Ibex core in two critical open source hardware development tools is an important milestone in Antmicro’s long-running collaboration with Google and Western Digital, both of which are driving the OpenTitan project as well as the FOSSi community, interested in open source simulation, synthesis, place & route and verification of designs of similar or bigger complexity than Ibex. A guide on using the Surelog/UHDM flow to synthesize the Ibex design is [available on our GitHub](https://github.com/antmicro/surelog-uhdm-ibex-guide).

Open source technologies are bringing a new dimension to FPGA/ASIC development flows. Learn more at antmicro.com.