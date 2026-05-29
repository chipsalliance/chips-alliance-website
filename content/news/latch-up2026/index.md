---
date: 2026-06-01T00:00:00Z
title: CHIPS Alliance at Latch-Up 2026
categories:
  - Blog
author: 
images: ['news/latch-up2026/latch-up-blog.jpg']
aliases: ['/blog/2026/06/01/chips-alliance-at-latch-up-2026/']
tags: [sv-tools]
---

CHIPS Alliance was proud to sponsor [Latch-Up 2026](https://fossi-foundation.org/latch-up/2026), held May 1-3, 2026, in Waterloo, Ontario, Canada. Organized by the [FOSSi Foundation](https://fossi-foundation.org/), Latch-Up is a weekend of presentations and networking dedicated to free and open source silicon. Designed for the open source digital design community, the event brings together engineers, developers, and contributors to share technical work and connect across the ecosystem. It is the North American counterpart of the European open silicon conference with a 14-year history, [ORCONF](https://fossi-foundation.org/orconf/2026), also organized by FOSSi, which CHIPS will be joining and sponsoring later this year.   

This year's program included several sessions closely aligned with CHIPS Alliance initiatives, covering SystemVerilog tooling, Verilator development, and open process design kits. [Session recordings are now available on YouTube](https://youtube.com/playlist?list=PLUg3wIOWD8yol2eb-LIcKZ08tbynkAJOV&si=43ZeJ8_AnurBGfyw).   

#### [CHIPS Alliance: Towards a Unified Open Source ASIC Design and DV Workflow](https://youtu.be/OWx3Bz25me4?si=1RnbEz98HCXcWUcm)   
Karol Gugala of Antmicro presented on behalf of CHIPS Alliance, outlining the organization's work to host and develop open source standards, IP, verification IP, interconnects, and tools for open source silicon development.   

A major focus of the presentation was the SV Tools project, which recently underwent a restructuring and now includes four projects: sv-tests, Verible, Synlig, and RISCV-DV. Karol explained that the project is focused on tooling around SystemVerilog and design tools.   

He also outlined several areas of active discussion within the community, including UVM-style verification in Verilator, improved integration between source code and waveform analysis, and coverage collection and visualization in open source tools.   

The presentation also highlighted the VeeR project, which maintains the VeeR EH1, EH2, and EL2 RISC-V cores, and Guineveer, an example SoC built using open source IP and the Topwrap SoC generation tool. Guineveer includes verification tests that run with Verilator and Renode and is built entirely in open source CI flows. [Watch here](https://youtu.be/OWx3Bz25me4?si=1RnbEz98HCXcWUcm).   

#### [Next Big Step for Verilator: Towards Four-State Logic and UVM Compatibility](https://youtu.be/G7Syiw_a0vo?si=2QtXqIzsbcBWRihn)   
Krzysztof Bieganski of Antmicro presented recent progress in Verilator related to UVM support, four-state logic, and related verification capabilities.   

Krzysztof reported that UVM 2020 can now be compiled with Verilator and said the team is focused on resolving remaining runtime issues in real design verification codebases, including RISCV-DV.   

He noted that nearly 100 pull requests had been submitted or merged over the previous six months, covering areas such as UVM classes, scheduling, constraint randomization, concurrent assertions, force and release statements, and optimizations.   

The presentation's central theme was ongoing work to add four-state logic support to Verilator. Krzysztof described this as a multi-pull-request effort and explained that an active development branch was already capable of simulating the CHIPS Alliance I3C core.   

He also highlighted the sv-tests dashboard, hosted by CHIPS Alliance, as a data-driven way to track progress across open source SystemVerilog tools. [Watch here](https://youtu.be/G7Syiw_a0vo?si=2QtXqIzsbcBWRihn).    

#### [From Open PDKs to Silicon: Progress at IHP](https://youtu.be/oco8MwSDWVc?si=alkYhmpCRLKj8OCN)   
Frank Vater of IHP - Leibniz Institute for High Performance Microelectronics presented an update on the institute's open source process design kit and open-silicon multi-project wafer program.   

Frank explained that IHP has offered MPW shuttle services since 2021 and announced its SG13G2 technology as an open source PDK in 2022.   

The talk reviewed both analog and digital design flows, including KLayout-based layout, ngspice simulation, OpenROAD flow scripts, and a digital standard cell library with 84 cells and I/O cells.   

Frank also introduced the open source SiMOS 5L offering, a lower-cost technology option for fully open designs. He noted that submitted designs must be released under the Apache 2.0 license, use open source tools, and be published on IHP's GitHub. [Watch here](https://youtu.be/oco8MwSDWVc?si=alkYhmpCRLKj8OCN).    

#### Open Source Silicon in Practice   
The sessions at Latch-Up 2026 highlighted complementary efforts across the open source silicon ecosystem: improving SystemVerilog tooling, expanding open verification capabilities - both of which are being pursued under the auspices of the newly re-formed SV Tools project (sv-tools@chipsalliance.org), and increasing access to process technologies and manufactured silicon - which is aligned with the ongoing efforts of CHIPS Alliance around a PDK-focused project. Subscribe to announce@chipsalliance.org to hear about updates in that regard.   

CHIPS Alliance was pleased to support Latch-Up 2026 and the technical community advancing open source silicon design and verification.   

Keep up to date with CHIPS Alliance by connecting with us on [LinkedIn](https://www.linkedin.com/company/chipsalliance/?viewAsMember=true) and subscribe to our [quarterly newsletter](https://www.linkedin.com/build-relation/newsletter-follow?entityUrn=7341146987217502211).    

