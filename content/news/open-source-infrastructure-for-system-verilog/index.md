---
date: 2021-07-20T00:00:00Z
title: Progress on Building Open Source Infrastructure for System Verilog
categories:
  - Blog
author: Rob Mains, General Manager of CHIPS Alliance
thumbImg:
  image_path: /images/blog-share.jpg
featuredImg:
  image_path: /images/blog-share.jpg
---

SystemVerilog is a rich hardware design description and verification language that is seeing increased usage in industry. In the second Deep Dive Cafe Talk by CHIPS Alliance on July 20, Henner Zeller, who is an software developer with Google, provided an excellent in depth technical talk on building out an open source tooling ecosystem around SystemVerilog to provide a common framework that can be used by both functional simulation applications as well as logic synthesis. In case you missed the live presentation, you can watch it [here](https://youtu.be/xLxNHBzmGiI). 

{{< youtube xLxNHBzmGiI >}}

Henner started the talk by providing background and motivation for the work on expanding the tooling available for SystemVerilog. It was noted that SystemVerilog is being used by a large cohort in industry, but there is little awareness that open source tools supporting SystemVerilog exist. Of note is that SystemVerilog is analogous to C++ as is Verilog to C in terms of language robustness and complexity. As such, developing a framework and metric-based scorecard to measure the quality of applications supporting this is of importance. A key aspect of adoption of SystemVerilog and associated open source tooling is that it works out of the box. Subsequently, the so-called sv-tests framework was created by Antmicro and Google – and subsequently transferred to CHIPS Alliance – as a unit test system for SystemVerilog tools to assess the quality of the parsing and handling of different attributes of the language. To incentivize participation, a [leader board](https://chipsalliance.github.io/sv-tests-results/) has been created to show quality of results. 

The talk also provided an overview of the different parsers Surelog, sv-parser, and Verible, along with discussion of their positive attributes and limitations. This was followed by presentation of UHDM (Unified Hardware Data Model) – a data model allowing transferring parsed and elaborated SystemVerilog between frontend and simulation or synthesis software.

An example integration of the UHDM based flow developed collaboratively by CHIPS members Google and Antmicro was presented next. The development aims to integrate the UHDM handling capability with Verilator simulator and Yosys synthesis tools. The work is done publicly in CHIPS Alliance’s GitHub repositories. The [UHDM integration tests repository](https://github.com/chipsalliance/UHDM-integration-tests) collects all the pieces of the system and allows running the integration tests.

The development and measurement of different applications to parse SystemVerilog and robustly represent in a common data representation will do much to ensure the development of a solid framework for construction of different design automation tools. 

The next CHIPS Alliance Deep Dive Cafe is on Tuesday, Aug. 10 at 4 p.m. PT. Experts from Intel and Blue Cheetah will present on PHYS, protocols, EDA, and heterogeneous integration as well as latest developments on die-to-die interfacing. You can register for the event [here](https://linuxfoundation.org/webinars/chips-alliance-deep-dive-cafe-talks-aib-deep-dive-opportunities/).