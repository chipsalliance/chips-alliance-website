---
date: 2021-12-17T00:00:00Z
title: Software-driven ASIC Prototyping Using the Open Source SkyWater Shuttle
categories:
  - Blog
author: 
images: ['news/software-driven-asic-prototyping-using-the-open-source-skywater-shuttle/share.jpg']
aliases: ['/blog/2021/12/17/software-driven-asic-prototyping-using-the-open-source-skywater-shuttle/']
tags: [tutorial, skywater]
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2021/12/sw-driven-asics-with-skywater-shuttle/).*

The growing cost and complexity of advanced nodes, supply chain issues and demand for silicon independence mean that the ASIC design process is in need of innovation. Antmicro believes the answer to those challenges is bound to come from the software-driven, open source approach which has shaped the Internet and gave rise to modern cloud computing. Applying the methodologies of software design to ASICs is however notoriously viewed as difficult, given the closed nature of many components needed to build chips – tools, IP and process design kits, or PDKs for short, as well as the slow turnaround of manufacturing.

The open source, collaborative SkyWater PDK project, combined with the free ASIC manufacturing shuttles running every quarter from Google and efabless, has been filling one of those gaps. Add to it open source licensed ASIC design tools we are [helping develop as part of CHIPS Alliance](https://chipsalliance.org/blog/2021/10/27/improving-the-openlane-asic-build-flow-with-open-source-systemverilog-support/) as well as [massive parallelization capabilities offered by the cloud](https://antmicro.com/blog/2021/08/open-source-github-actions-runners-with-gcp-and-terraform/) and what you get is an ASIC design ecosystem at the verge of a breakthrough. To effect this change, together with Google, efabless, SkyWater and others we are working on more developments, including letting the shuttle designs benefit from software-driven hardware productivity tools such as LiteX and [Renode](https://renode.io/) (which we are currently helping the SkyWater shuttle effort to adopt), as well as new and exciting developments in the process technology itself.

If you want to participate in making ASIC design history, let us show you why and how the shuttle program is the way to do that. And by the end of this article, hopefully you will want to participate in the next, [fourth shuttle with the submission deadline at the end of this year](https://efabless.com/open_shuttle_program/4).

![chip tapeout](asic-design-tapeout.png)

## SkyWater PDK – some background

In May 2020 Google and [SkyWater Technology Foundry](https://www.skywatertechnology.com/) released the first ASIC proven [open source PDK](https://github.com/google/skywater-pdk). The PDK targets the 130 nm process which, while not state-of-the-art, is still in widespread practical use, especially in mixed-signal and specialized designs.

The PDK release involved restructuring the original code and data and properly documenting all the available cells in the PDK. This operation was performed in a collaboration between [a group of industrial and academic partners](https://skywater-pdk.readthedocs.io/en/main/partners.html#industry-partners), with Antmicro’s effort focused mostly on developing tools for automatic PDK structuring and documentation.

An open source PDK was a key missing piece in end-to-end open source ASIC development, but in itself would not allow the average developer to feel the change. To enable developers to work with the PDK in practice and build fully open source chips with fast turnaround that is necessary to breed the necessary innovation, Google funded the [Open MPW Shuttle](https://efabless.com/open_shuttle_program/) Program operated by efabless, a fellow CHIPS Alliance member. The program assumes the applying projects are fully open source and based on a permissive license, targets the 130 nm SkyWater process and uses open source ASIC toolchain. Projects accepted in the program are then manufactured and the authors receive their packaged ASICs without any additional costs – production, packaging, testing and delivery is all covered for.

The program is a great opportunity for any developer wanting to develop open source ASICs and contribute to the emerging open source ASIC community. The first shuttle program attracted 37 projects, including:

- Five RISC-V SoCs
- A cryptocurrency miner
- A robotic app processor
- A template SoC based on OpenPOWER
- An Amateur Satellite Radio Transceiver
- Analog/RF IPs
- Four eFPGAs
- [Antmicro’s AES-128 core integration](https://efabless.com/projects/32)

We have been assisting customers expressing the desire to participate in the SkyWater shuttle in assessing the feasibility of their designs, creating the necessary workflows and adapting the tools involved to their particular needs.

Our engineering services can be used to enhance your development teams with the ability to use open source tools more effectively and integrate with your infrastructure in a way which allows you to benefit from the open source’s capabilities while not disrupting your internal workflows unnecessarily.

In total, over 100 designs have been sent to fabrication so far, many authored by teams with a predominantly software background. With over 2500 users in the SkyWater open source PDK slack, this is truly a community in the making.

Most of the designs in the shuttles use the [Caravel](https://github.com/efabless/caravel) harness design which implements a RISC-V CPU with some base peripherals, [OpenRAM](https://github.com/VLSIDA/OpenRAM) generated memory, an I/O ring and a user area where developers can place their designs. The harness design is meant to be a fixed block / starting point which significantly lowers the entry level for the ASIC developers, but as such is also subject to evolution to better answer the needs of the shuttle participants, which we will describe later in the note.

## Open source ASIC tools

The core part of the PDK shuttle process uses the [OpenLane](https://github.com/The-OpenROAD-Project/OpenLane) toolchain, a flow based on the [OpenROAD](https://theopenroadproject.org/) project, also a part of CHIPS Alliance. The toolchain implements all the steps required to generate a production-ready ASIC layout (GDS) from an RTL design.

![ASIC design with SkyWater Shuttle diagram](asic-design-diagram.svg)

Since production is the most expensive and time consuming part of the process, testing and validation are key stages in need of innovation, and the experiences learned from the SkyWater shuttle effort are invaluable.

Under the auspices of CHIPS Alliance, [Google, Western Digital and Antmicro are leading the work](https://antmicro.com/blog/2021/07/open-source-systemverilog-tools-in-asic-design/) on enabling fully open source SystemVerilog development, testing and validation. The work focuses on a number of design flow aspects, including:

- [Code quality control](https://antmicro.com/blog/2021/08/verible-integration-with-github-actions/)
- [Open source design verification](https://antmicro.com/blog/2021/05/dynamic-scheduling-in-verilator/)
- [SystemVerilog synthesis](https://antmicro.com/blog/2021/10/openlane-asic-build-flow-with-systemverliog-support/)

All these are meant to improve the development experience and benefit from the inherent scalability and reusability of open source tools to offer practical value for teams building new ASIC designs.

## Adoption of LiteX for Caravel

Open source design tools constitute one aspect of fully open source ASIC design. The other aspect, just as important as tooling, is open source, high-quality, reusable IP cores, and indeed the very rules of the SkyWater shuttle program encourage developers to open source their design and reuse existing cores.

At the core of the shuttles is the Caravel harness. To improve the shuttle’s user experience and let the community benefit from a wider array of off-the-shelf tools and cores, we are assisting with the ongoing effort of adopting the Caravel design to be based on [LiteX](https://github.com/enjoy-digital/litex).

LiteX, a widely known open source SoC generator, will make it possible for more open source cores to be integrated with ASIC designs, ultimately lowering the entry barrier for software engineers. It comes with multiple ready to use cores, including an open source DRAM controller used in the [Rowhammer test platform](https://antmicro.com/blog/2021/08/open-source-ddr-test-framework-for-rowhammer/) we described some time ago. This alternative harness, whose development you can track in a [dedicated GitHub repository](https://github.com/efabless/caravel_mgmt_soc_litex), will open the door to more contributions from the LiteX community and allow us to use a bunch of tools that we have already integrated, like our open source simulation framework, Renode.

## Renode’s hardware/software co-development capabilities

The LiteX framework provides developers with an easy way to experiment with various different CPU cores. Testing a system against many possible cores, often running complex software, makes validation no trivial task.

[Renode](https://renode.io/), Antmicro’s open source development framework, features advanced SW/HW/FPGA/ASIC co-simulation capabilities and has been directly integrated with LiteX to generate the necessary configurations that correspond to the hardware system. Renode supports a multitude of CPU, I/O IP, sensor and network building blocks, both native to LiteX and otherwise, allowing its users to simulate the entire platform design before implementation, i.e. in the pre-silicon stage.

Renode addresses the profound challenge of testing complex software, running it on various CPUs and using custom peripheral cores at the same time. Developers can make use of Renode’s ability to [co-simulate with Verilator](https://antmicro.com/blog/2019/09/renode-verilator-hdl-co-simulation/) or with [physical hardware](https://antmicro.com/blog/2019/10/renode-with-etherbone-support/), reducing the simulation time of SoC systems that utilize custom IP cores.

Back in September, [Antmicro presented a case of co-simulating](https://antmicro.com/blog/2021/09/co-simulation-for-zynq-with-renode-and-verilator/) the popular Xilinx Zynq-7000 SoC running Linux with a verilated [FastVDMA core](https://opensource.antmicro.com/projects/fastvdma), and of course [co-simulation with platforms like the PolarFire SoC](https://antmicro.com/blog/2021/06/advanced-co-simulation-with-renode-and-verilator/) is something we have been steadily improving on with our partner Microchip.

A similar kind of development methodology will be possible with the new Caravel harness.

Taking that HW/SW co-design workflow to its natural consequence, as showcased by our work with Google, Dover Microsystems and others, Renode allows developers to build SW-oriented hardware faster than HDL and benefit from the flexibility known from software development cycles where iterations happen in a matter of days. Recently, Renode has been extended with support for [RISC-V vector instructions](https://antmicro.com/blog/2021/12/riscv-vector-instructions-in-renode) which translates into a further improvement of the development process of machine learning algorithms in open source ASICs.

## Scaling into the cloud and hybrid setups

Building and testing ASIC designs is often a time and resource intensive task. The open source tooling approach, endorsed by the SkyWater shuttle program, possesses an important advantage over any proprietary perspective – it allows for infinite scaling of compute resources as there are neither licensing costs nor other license related limitations involved.

Developments around distributed and scalable cloud based CI/CD systems like [self-hosted GitHub Actions runners in GCP](https://antmicro.com/blog/2021/08/open-source-github-actions-runners-with-gcp-and-terraform/), a collaboration between Antmicro and Google, are providing the ecosystem with new options for reliable, fast testing and deployment of ASIC designs. Cloud based CI systems can be built to combine both closed and open source solutions, providing hybrid solutions that fill the gaps of either approach. And on a more general level, scalable and accessible CI/CD systems facilitate collaboration between large and geographically distributed teams of developers.

## New developments

SkyWater PDK is being constantly improved, extending the possibilities for future designs. One of the [recent add-ons](https://github.com/google/skywater-pdk/pull/346) to the PDK is a [ReRAM library](https://www.skywatertechnology.com/press-releases/weebit-and-skywater-announce-agreement-to-take-reram-technology-to-volume-production/) which can be used to develop non-volatile memories using the SkyWater 130nm technology.

Further SkyWater PDK development plans include extending the PDK portfolio with 180nm, 90nm and 45nm technology processes – stay tuned for upcoming developments in that space!

## Participate in shuttle runs

Three shuttle runs have already happened, and thanks to Google’s commitment as well as the overwhelming interest from business, research and government institutions, the project will continue through 2022 and most likely beyond. The [4th shuttle run is currently open](https://efabless.com/projects/shuttle_name/MPW-4) and will be accepting submissions by December 31, 2021.

For projects that, for any reason, cannot be open sourced or submitted within the timeline of the open shuttle, a private shuttle called [ChipIgnite](https://efabless.com/chipignite/2110C) has been created.
