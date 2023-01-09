---
date: 2020-09-15T00:00:00Z
title: "The CHIPS Alliance Workshop: 10 Talks From Industry Leaders, All For Free"
categories:
  - Blog
author:
thumbImg:
  image_path: /images/blog-share.jpg
featuredImg:
  image_path: /images/blog-share.jpg
---

Mark your calendars! The [CHIPS Alliance Workshop](https://events.linuxfoundation.org/chips-alliance-workshop/) is coming up on Thursday, Sept. 17 from 11 a.m. to 2 p.m. PT. This free, virtual event will feature talks from industry leaders including Antmicro, Efabless, Google, Intel, Mentor, Metrics, OpenROAD, QuickLogic, SiFive, UC Berkeley and Western Digital.  

The CHIPS Alliance Workshop will fit 10 sessions into three hours for a jam-packed event covering a range of interesting topics in the open source community. You’ll hear about open source ASICs, chiplets, FPGAs and SoCs, in addition to open source design verification, FPGA tooling, machine learning accelerators and more. Read on for additional details, and make sure to [register](https://events.linuxfoundation.org/chips-alliance-workshop/register/) before it’s too late.

Check out the schedule below to learn more about what the sessions will cover:

#### 11:00 a.m. PT: Keynote Kick-Off – CHIPS Alliance

- Brief welcome

#### 11:05 a.m. PT: Open Design Verification – Tao Liu, Google

- Open source design verification is a key enabler for more collaborative flows in ASIC development. The RISC-V DV framework, based on an open source instruction set generator developed by Google, is enabling end-to-end verification flows for RISC-V CPUs.  The generator supports all RISC-V ISA extensions, and can be configured to generate highly random tests for various RISC-V processors. This talk will cover the fundamentals of the flow and recent developments including Bit-manipulation extension, Vector extension, multi-cores verification, functional coverage model, python based random instruction generator etc.  Learn more about the technology and its latest developments in Tao Liu’s talk. 

#### 11:25 a.m. PT: Enabling Fully Open Source And Continuous Integration-Driven Flows in ASIC and FPGA Development – Michael Gielda, Antmicro

- ASIC and FPGA development is making rapid strides towards adopting fully open source, software-oriented approaches where large-scale collaboration and CI are possible. The developments include new frameworks such as UHDM and sv-tests aimed at improving SystemVerilog support in linting, formatting, synthesis and simulation, ongoing work in Verilator towards providing UVM support for open source verification, advances in the open source SymbiFlow toolchain which opens up FPGAs and ASIC prototyping to more software-oriented experimentation and collaboration. We also have the OpenROAD flow and SkyWater PDK tackling end-to-end open source ASIC design, and general progress in the open IP ecosystem – including new and exciting RISC-V and OpenPOWER cores – energizing the community. In this talk, Michael Gielda, VP Business Development at Antmicro, will highlight recent developments and explain the vision for open source chips that Antmicro and the CHIPS Alliance are spearheading.

#### 11:45 a.m. PT: The Emergence of the Open-Source AIB Chiplet Ecosystem – David Kehlet, Intel

- The AIB chiplet ecosystem has built and powered on ten chiplets across seven process nodes, leveraging three different foundries, and contributing to two different product families.  Among the chiplet functions are AI acceleration, high-speed transceivers, optical interfaces, and high-speed ADCs/DACs.  The demand for AIB-enabled chiplets has spurred the release of an automated AIB PHY generator tool, which will help speed the next generation of AIB adopters to complete their projects.  Dave Kehlet, Research Scientist at Intel, will cover these topics, the new release of the AIB 2.0 specification with even higher bandwidth and lower power, and consideration of future layers needed as open source.

#### 12:05 p.m. PT: Chipyard: Design of customized open-source RISC-V SoCs – Borivoje Nikolic, UC Berkeley

- Chipyard is an integrated SoC design, simulation and implementation environment for specialized compute systems. Chipyard includes configurable, composable, open-source, generator-based blocks that can be used in multiple stages of the hardware development flow, while maintaining design intent and integration consistency.  Chipyard is built around the open-source RocketChip generator, and targets cloud FPGA implementation and rapid ASIC implementation, allowing for continuous validation of physically realizable customized systems.

#### 12:25 p.m. PT: SweRV and OmniXtend Milestones – Zvonimir Bandic, Western Digital

- The Open Source RISC-V SweRV Cores have been increasingly adopted by organizations who prioritize a validated, production worthy core. The latest updates on the first commercial dual threaded, embedded SweRV EH2 will be highlighted. This talk will discuss progress on the open cache coherent memory fabric, OmniXtend. The breakthrough architecture uses low cost Ethernet to connect memory to hosts. OmniXtend frees main memory from the CPU and enable next generation memory centric architectures to become a reality. 

#### 12:45 p.m. PT: Chisel & FIRRTL for next-generation SoC designs – Jack Koenig, SiFive

- The Chisel Working Group is dedicated to improving the productivity of digital design and verification to enable next-generation SoC designs based on open-source tools. Its namesake project, Chisel HDL, is a domain-specific language embedded in Scala that provides designers with modern programming techniques like object orientation, functional programming, parameterized types, and type inference. CWG also includes FIRRTL, the hardware compiler framework that enables decoupling design from implementation via target specialization and custom transformations. In this talk, you’ll learn about the exciting improvements to the various projects, as well as the adoption of formal governance.

#### 1:05 p.m. PT: Open ML Accelerator – Anoop Saha, Mentor

- High Level Design or High Level Synthesis (HLS) helps users to design hardware at a higher level of abstraction and consequently, improve productivity and reduce costs. This methodology has gained traction in the design of custom application specific accelerators for machine learning. In this talk, Mentor’s Anoop Saha will go over the HLS ecosystem and the open source HLS components that help in building an accelerator. This ecosystem provides resources from IP libraries to full toolkits with real working designs.

#### 1:25 p.m. PT: Cloud Based Verification of RISC-V Processors – Dan Ganousis, Metrics

- Open-source ISAs such as RISC-V allow users to modify/optimize processor IP for their SW applications. With that benefit, however, comes the responsibility of the user to fully verify the modified processor IP. Many ASIC design groups do not have the requisite processor verification skills and simulation capacity and have realized delayed schedules and budget overruns. Metrics CloudSim provides a simple and economical verification solution in the Cloud that provides scalable computing, elastic storage, and a SaaS business model.

#### 1:35 p.m. PT: OpenROAD open RTL-to-GDS update – Andrew Kahng, OpenROAD/UCSD, and Mohamed Kassem, Efabless 

- The OpenROAD project seeks to develop an open-source RTL-to-GDS tool that generates manufacturable layout from a given hardware description in 24 hours,  with no human in the loop. By reducing cost, expertise and schedule barriers to hardware design, OpenROAD enables greater access to ASIC implementation and accelerates system innovation in hardware. This talk will give an update on OpenROAD’s status and near-term outlook. The OpenROAD tool is integrated around  an open-source, commercial-quality database and timing engine. A SkyWater 130nm tapeout was made by efabless.com in May, and DRC-clean layout generation in GLOBALFOUNDRIES 12nm was achieved in July.  Efabless will describe the “OpenLANE” flow that integrates much of OpenROAD’s tooling, and the striVe family of SoCs being taped out on SKY130. 

#### 1:50 p.m. PT: Open Source FPGA Tooling, Our Journey from Resistance to Adoption – Brian Faith, QuickLogic

- Since the inception of the Programmable Logic industry, the vendor-supported FPGA development tools have been proprietary and closed source. Initially this was simply because that is the way things were done – there were no open standards. But over time, keeping them closed and proprietary enabled a level of influence and control over users. If a designer liked your software, they tended not to change, and that implicitly makes your user base captive.  Open source FPGA tools have been around for a long time, being used primarily by hobbyists and in academia. However, over the past few years, an increasing number of new developers with software backgrounds are gravitating towards open source FPGA development tools.  With companies like [Google](http://www.google.com/) and [Antmicro](http://www.antmicro.com/), as well as several universities, making significant contributions to them, these tools are only going to keep getting better.  In this talk, Brian Faith, CEO of QuickLogic, will share their journey from resistance to adoption, how they decided to take the leap into open source FPGA tooling, becoming the 1st Programmable Logic company to do so.

#### 2:00 p.m. PT: Summary Wrap-Up


For more information about the CHIPS Alliance and our activities over the past year, check out our [2020 Annual Report](https://chipsalliance.org/chips-alliance-2020-annual-report/) and our recent news. We look forward to seeing you at the Workshop! 