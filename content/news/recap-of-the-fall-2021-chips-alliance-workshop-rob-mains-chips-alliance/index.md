---
date: 2021-10-26T00:00:00Z
title: Recap of the Fall 2021 CHIPS Alliance Workshop
categories:
  - Blog
author: 
images: ['images/blog-share.jpg']
---

We recently held our fall 2021 CHIPS Alliance workshop with nearly 160 attendees present for informative seminars covering a range of topics including porting Android to RISC-V, open source ASIC design and FPGA tooling, and OmniXtend. In case you missed the talks, a replay is available [on the CHIPS Alliance YouTube channel](https://www.youtube.com/watch?v=auXZdPwYs10).

During the seminar, we had eight exciting technical presentations, including:

- [Porting Android to RISC-V](porting-android-chips_alliance-slides-v1.2-Han-Mao.pdf) – Guoyin Chen and Han Mao, Alibaba
- [Practical Adoption of Open Source SystemVerilog Tools](Practical-Adoption-of-Open-Source-System-Verilog-Tools-CHIPS-Fall-Workshop-Michael-Gielda.pdf) – Michael Gielda, Antmicro
- [Chisel and FIRRTL for Next-Generation SoC Designs](ChiselTalk_ChipsAlliance_2021_October-Jack-Koenig.pdf) – Jack Koenig, SiFive
- [OpenFASOC: Automated Open Source Analog and Mixed-Signals IC Generation](OpenFASOC_-Open-Source-Fully-Autonomous-SoC-Synthesis-using-Customizable-Cell-Based-Synthesizable-Analog-Circuits-CHIPS-Alliance-Mehdi-Saligane.pdf) – Mehdi Saligane, University of Michigan (UMICH)
- [FPGA Tooling Interoperability with the FPGA Interchange Format](FPGA-Tooling-Interoperability-with-the-FPGA-Interchange-Format-Maciej-Kurc.pdf) – Maciej Kurc, Antmicro
- [OmniXtend: Scalability and LPC](OXLPC_ChipsAlliance-Jaco-Hofmann.pdf) – Jaco Hofmann, Western Digital Corporation
- [Open Source NVME IP with AI Acceleration](Open-Source-NVME-IP-with-AI-Acceleration-Karol-Gugala.pdf) – Anand Kulkarni, Western Digital Corporation and Karol Gugala, Antmicro
- [Automating Analog Layout using ALIGN](2021-10-CHIPS_Alliance-Sachin-Sapatnekar.pdf) – Sachin Sapatnekar, University of Minnesota (UMN)

Each of these talks provided informative, technical details of key aspects of the work underway by members of CHIPS Alliance who are working in an open, collaborative fashion. Of particular interest are the following topic areas:

[Porting Android to RISC-V](porting-android-chips_alliance-slides-v1.2-Han-Mao.pdf)

The presence of RISC-V is significantly growing, thanks in part to its applicability for the IoT, mobile market, and even the data center. Alibaba shared its experience porting the Android operating system to RISC-V, discussing their challenges and successes, and what is needed to help build out the ecosystem for the RISC-V ISA.

Design Languages: [Practical Adoption of Open Source SystemVerilog Tools](Practical-Adoption-of-Open-Source-System-Verilog-Tools-CHIPS-Fall-Workshop-Michael-Gielda.pdf), and [Chisel and FIRRTL for Next Generation SoC Designs](ChiselTalk_ChipsAlliance_2021_October-Jack-Koenig.pdf)

These two talks showcased the continuing efforts to build robust support for different design description languages. 

In the first talk, Antmicro provided an overview on the latest developments in open source SystemVerilog tooling, covering the construction of the ecosystem and efforts to support SystemVerilog more robustly, including the creation of a Universal Hardware Data Model ([UHDM](https://github.com/chipsalliance/uhdm)), continued support of two industry-grade SystemVerilog parsers – [Surelog](https://github.com/chipsalliance/verible) and [Verible](https://github.com/chipsalliance/verible) – as well as a set of tests and scoreboard to determine the quality of different SystemVerilog applications and work towards UVM support in Verilator.

From CI-assisted linting and formatting to fully open source synthesis and simulation, the talk pointed out that adding SV support to open ASIC design flows is a way to make emerging ecosystems such as OpenLANE/OpenROAD work with the growing number of designs described in this language (e.g. OpenTitan’s Ibex/Earl Grey, OHG’s Core-V, University of Washington’s BlackParrot, or CHIPS Alliance’s SWeRV). The future of open ASIC design, as spearheaded by members of CHIPS, will be pluralistic. 

The talk on Chisel and FIRRTL updated the community on the progress with the Chisel design language, which is based upon Scala. For those who are unfamiliar, this introduces object oriented design concepts and expression to a hardware design language. Similar to what occurred in software, the introduction of object oriented concepts serves to increase the productivity of a hardware design engineer. FIRRTL provides a hardware compiler for a design described in Chisel. A key feature of this is the ability to natively embed formal verification as part of the design, which is typically a difficult task. FIRRTL also enables target output to different applications including Verilator for functional verification, OpenROAD for physical implementation, and for FPGA emulation. 

[FPGA Tooling Interoperability with the FPGA Interchange Format](FPGA-Tooling-Interoperability-with-the-FPGA-Interchange-Format-Maciej-Kurc.pdf)

Over the past few years, FPGAs have become a strategic component in the arsenal of different computational platforms, from labs and desktops to datacenters. Their flexibility to be dynamically reconfigured based upon updates to underlying changes in the hardware design and its emulation make them very helpful for rapid prototyping of new ideas and quickly moving into production. This has been a tremendous benefit for the rapid development and deployment of new machine learning algorithms and their usage in the datacenter. 

This talk discussed work to provide a common open device and design representation format, enabling various FPGA design toolchains (both open source and proprietary) to seamlessly interoperate in a design build task. With the Interchange format in place a designer can choose between tools available in different toolchains (e.g. place design with an open source flow, and later route it with a proprietary one).This will enable different companies, universities, and individuals to focus on research and development on a certain part of the flow, without the necessity of implementing the whole toolchain at once. 

[OmniXtend Scalability and LPC](OXLPC_ChipsAlliance-Jaco-Hofmann.pdf)

This session highlighted the progress of the joint working group with RISC-V International on the cache coherency project, which is making the protocol extensible to a family of participant devices. The talk started with a brief tutorial on the nature of OmniXtend. This update specifically highlighted the extension of OmniXtend to be able to dynamically detect the addition or subtraction of devices to the shared bus between intelligent devices. This 1.1 version of the protocol will be fully released under the Apache 2.0 license in Github.

[Open Source NVME IP with AI Acceleration](Open-Source-NVME-IP-with-AI-Acceleration-Karol-Gugala.pdf)

This talk discussed the need for machine learning accelerators in proximity to data storage. The talk covered the overall architecture of a data-centric, parallel processing system developed by Antmicro in collaboration with Western Digital, including FPGA implementation of the NVMe core and software architecture with Zephyr RTOS running on the Cortex-R5 RPU and Linux on the Cortex-A53 core of the Xilinx UltraScale MPSoC chip. Both systems use OpenAMP for asynchronous communication, allowing the RTOS to handle base NVMe commands and delegate the rest to the Linux application. To speed up ML algorithm inference, VTA (an open source FPGA AI accelerator) was employed. The ML algorithms were developed using TensorFlow Lite. 

Analog design automation: [OpenFASOC](OpenFASOC_-Open-Source-Fully-Autonomous-SoC-Synthesis-using-Customizable-Cell-Based-Synthesizable-Analog-Circuits-CHIPS-Alliance-Mehdi-Saligane.pdf) and [ALIGN](2021-10-CHIPS_Alliance-Sachin-Sapatnekar.pdf)

Analog design is still considered magic to most of us. Unbeknownst to many, analog is a key part of many of the electronic devices we enjoy, not the least of which is the mighty smartphone. Analog design is typically the long pole in a chip design schedule, often performed by a select group of engineers and done primarily by manual means. Both of these talks discussed efforts to automate the analog design process, significantly improving the productivity of the design team, reducing the time to market, and also enabling technology migration from process node to node. 

Our next technical talk will be a [CHIPS Deep Dive Cafe Talk](https://chipsalliance.org/workshops-meetings/) on Tuesday, Nov. 9 at 8 a.m. PT entitled “Learning To Play the Game of Macro Placement with Deep Reinforcement” by Young-Joon Lee of Google. I hope you are able to join us for this exciting and informative talk. To register, please visit [here](https://zoom.platform.linuxfoundation.org/webinar/register?project=chips&id=hlDaC2aYQyhmseqBMn07SrC7%2FZgIic0A8Nk5xV4CoyL7XqI9EZbk%2Bg%3D%3D&logo=chipsalliance-color.svg&zoomID=93071044882).