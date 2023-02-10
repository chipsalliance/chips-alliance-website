---
title: Workgroups
description: >-
   The CHIPS Alliance hosts multiple open source Projects. Similar Projects are organized into Workgroups. Each Project elects a representative to participate on the TSC.
image_path: images/feature/48302011232_72f8ed17c8_o.jpg
---

CHIPS Alliance will be adding Projects over time as the community gets started and may spin up or wind down Workgroups as needed to reflect our work across the SoC and tooling ecosystem. We welcome code, engineer involvement and partnership collaborations to further define and focus projects into relevant and strategically critical opportunities. Members and non-members alike are invited to participate in our work to change the landscape of chip development to be more open source. Please join the [technical-discuss mailing list](https://lists.chipsalliance.org/g/technical-discuss) to get started!

## Analog Workgroup

The Analog workgroup was formed by the CHIPS Alliance TSC to explore collaborations in open source Analog/Mixed-Signal design and verification. It focuses on sharing best practices, ideas, tooling (analog automation), and other challenge areas in the design space. The workgroup is composed of both industry and university members.

- Mailing list: analog-wg@lists.chipsalliance.org
- Meetings: Every Tuesday at 9:00 a.m. PT as scheduled
- Please contact rmains@linuxfoundation.org for details
- [Zoom Informaton](https://zoom.us/j/93893684803?pwd=bWpzRHZZMFpCbG9lUmZBVld4VFFqUT09) passcode: analog

## Chisel Workgroup

The [Chisel](https://www.chisel-lang.org/) Workgroup is formed around the eponymous hardware design language (HDL) that facilitates advanced circuit generation and design reuse for both ASIC and FPGA digital logic designs. Chisel adds hardware construction primitives to the [Scala](https://www.scala-lang.org/) programming language, providing designers with the power of a modern programming language to write complex, parameterizable circuit generators that produce synthesizable Verilog. Chisel is powered by [FIRRTL (Flexible Intermediate Representation for RTL)](https://github.com/chipsalliance/firrtl), a hardware compiler framework that performs optimizations of Chisel-generated circuits and supports custom user-defined circuit transformations on an Intermediate Representation. The WG also covers tools such as [Treadle](https://github.com/chipsalliance/treadle) which is an experimental circuit simulator that executes the Firrtl IR. 

- [Mailing list](https://lists.chipsalliance.org/g/chisel-wg/topics)

## Cores Workgroup

We are currently looking for more contributors to reboot our Cores Workgroup. If you are interested in working around open source implementation and verification methodologies and other tooling for cores, reach out to tsc@lists.chipsalliance.org

- [Mailing list](https://lists.chipsalliance.org/g/cores-wg)

## F4PGA Workgroup

The F4PGA Workgroup was formed to drive open source tooling, IP cores and research for FPGA devices. It includes three major groups whose collaboration is critical to the success of the open source approach in this space: FPGA vendors, industrial users and university members. Its main focus is enabling rapid prototyping and software-driven development of FPGA-oriented systems in areas such as ML and video processing. The workgroup provides an open collaboration platform for its members, aiming at accelerating the speed of innovation in FPGAs and the general availability of the technology. The initial projects contributed into CHIPS Alliance within the F4PGA Workgroup are focused around the free and open source FPGA toolchain formerly known as SymbiFlow, as well as the so-called FPGA Interchange format.

- [Website](https://f4pga.org/)
- [Mailing list](https://lists.chipsalliance.org/g/f4pga-wg)

## Interconnects Workgroup

- [Mailing list](https://lists.chipsalliance.org/g/interconnects-wg)
- Meetings: Once a month at 10:30 a.m. PT; [Calendar](https://lists.chipsalliance.org/g/interconnects-wg/calendar)

## Rocket Workgroup

The Rocket Chip Workgroup covers the “Rocket” pipelined implementation of a RISC-V core as well as a TileLink uncore and cache coherent memory hierarchy. The main rocket-chip repository that the group maintains is a meta-repository containing tools needed to generate and test RTL implementations of SoC designs. This repository contains code that is used to generate RTL using [Chisel](http://chisel.eecs.berkeley.edu/) and Diplomacy: the Rocket Chip generator itself is a Scala program that invokes the Diplomacy library and Chisel compiler in order to emit RTL describing a complete SoC.

- [Mailing list](https://lists.chipsalliance.org/g/rocket-wg)

## Tools Workgroup

The Tools workgroup (WG) of CHIPS Alliance covers a wide array of open source tooling for ASIC and FPGA design, mostly focusing around digital design (as there is a separate Analog WG that focuses on AMS design flows). The topics covered include simulation, synthesis, place and route, IP aggregation, linting, formatting, and many more.

- [Mailing list](https://lists.chipsalliance.org/g/tools-wg)
- Meetings: Every other Friday (currently odd weeks) at 7 a.m. PT, [Google Meet link](https://meet.google.com/ncy-rzzp-tfv?hs=122)

## RISC-V DV Subgroup

RISC-V DV is an open source verification tool for RISC-V processors, a SystemVerilog based random RISC-V instruction generator that checks the execution against multiple ISS for correctness and compliance. This Subgroup of the Tools Workgroup is concerned with the development of the RISC-V DV framework and related technologies.

- [Mailing list](https://lists.chipsalliance.org/g/tools-wg): riscv-dv-wg@lists.chipsalliance.org
- Meetings: Every other Friday (currently even weeks) at 9:00 a.m. PT, [Google Meet Link](https://meet.google.com/soh-ovxy-vez)

## SystemVerilog Subgroup

This Subgroup of the Tools Workgroup gathers projects related to the SystemVerilog (SV) Hardware Description Language (HDL) and making it work in open source tooling. This includes CHIPS Alliance projects such as Verible and Surelog and integration with well-established open source tools like Verilator and Yosys.

- Meetings: Users meet as part of the regular Tools Workgroup meetings; Developers meet Tuesdays at 9:00 a.m. PT
