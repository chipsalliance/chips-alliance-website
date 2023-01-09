---
date: 2021-09-09T00:00:00Z
title: SymbiFlow FPGA Interchange Format to Enable Interoperable FPGA Tooling
categories:
  - Blog
author: 
images: ['/images/blog-share.jpg']
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2021/09/symbiflow-fpga-interchange-format/).*

[Field Programmable Gate Arrays (FPGAs)](https://antmicro.com/technologies/fpga/) have been around for several decades, but historically development of toolchains targeting specific platforms was done in separate ecosystems and driven by the vendors themselves. Only in recent years, the development of vendor-neutral open source toolchains has revealed the need of having an abstraction layer to describe and define an FPGA architecture through a standard format.

FPGA toolchains are not trivial as they comprise several elements which themselves can be quite complex: roughly speaking, you can divide the process of “compiling” FPGA-targeted code in a Hardware Description Language (HDL) into three stages: synthesis, place and route, bitstream generation. A standard format could provide a common description of the various architectures and serve as a bridge between the multitude of open source and closed proprietary tools that deal with the entire process or parts thereof, including the open source Yosys for synthesis and VtR and nextpnr for place and route, to relevant vendor tooling from Xilinx, Intel, Lattice, QuickLogic, etc.

The introduction of a common format enables a shared methodology where specific building blocks are simply interchangeable. With that in mind, together with Google we started the [FPGA Interchange Format](https://fpga-interchange-schema.readthedocs.io/) project within the SymbiFlow initiative, bringing forth a unified framework that, by lowering the entry barriers, lets developers swiftly move from one tool to another with virtually no effort. As part of our collaboration with Google, Antmicro is now developing the Interchange format definition and related tools which aim to become a development standard the FPGA industry has been in need of.

## Interchange format: components

The Interchange format provides three key descriptions to describe an FPGA and interact with the various tools involved:

- Device resources: defines the FPGA internal structure as well as the technological cell libraries describing FPGA logic blocks (basic blocks like flip-flops and complex like DSP cells),
- Logical netlist: post-synthesized netlist compatible with the Interchange,
- Physical netlist: collection of all placement locations and physical routing of the nets and resources produced by the place and route tool.

One of the main challenges behind the creation of a standard format, specifically for the device resources, lies in the definition of the line between generalization and specificity of an FPGA architecture, as each device architecture variant may have some individual features that can be difficult to generalize in the context of other variants.

For this practical reason, the FPGA Interchange format in its current form focuses on the only architecture type in mainstream use on the market today, namely island-based (also called tile-based) FPGAs: two-dimensional arrays of reconfigurable logic blocks, hard blocks, switch blocks and input-output blocks.

This allows the standard to reach a level of universality and conciseness which makes it easy to work with, adopt and implement.

## Interchange format: implementation

After determining what the Interchange format should describe, the next step was to define how to best implement the format itself. The choice fell on a well-supported, open source and fast serialization protocol – [Cap’n Proto](https://capnproto.org/).

Cap’n Proto allows a great efficiency in terms of run-time and on-disk memory occupation, given also the huge amount of elements that are present in an FPGA device, such as wires and connections, that need to be stored in the device database. The protocol enables a concise, well-defined and, if used correctly, a backward compatible [architecture and netlist format description](https://github.com/SymbiFlow/fpga-interchange-schema).

The framework uses the [Cap’n Proto schema language](https://capnproto.org/language.html) whose implementations exist in many of the most common programming languages such as C++, Python, Java and Rust. This gives a good chance of future interoperability with other tooling that will inevitably emerge if the standard is successful.

On top of the FPGA Interchange schema definitions, a [Python-based library](https://github.com/SymbiFlow/python-fpga-interchange) was created to interface with the schema itself, and provides functionalities to read and write device databases, logical netlists and physical netlists, as well as utilities to convert from one representation to another. It is often the case where a physical netlist needs to be inspected and analyzed, and a Cap’n Proto serialized netlist can be easily converted to its YAML or JSON human-readable equivalents.

## Interchange format: how it works

As previously mentioned, the FPGA Interchange format aims at lowering the barriers and building bridges between different place and route tools that can read and write using the same convention.

In this sense, the major milestone of the Interchange format was to have the production and exchange of the physical netlist between one place and route tool and another.

To reach this milestone, [nextpnr](https://github.com/YosysHQ/nextpnr) was chosen as the first place and route tool to adopt the Interchange format. In the past few months, we extended nextpnr with FPGA Interchange format capabilities and currently the tool is able to place and route basic designs for the Xilinx 7-series and Lattice Nexus FPGA families using the format.

To achieve initial support for Xilinx devices, the vendor’s own extremely interesting [RapidWright](https://github.com/Xilinx/RapidWright) framework has also been introduced to the flow, and it is specifically used to write the device database in the Interchange format, consisting of all the device information.

Additionally, RapidWright is able to read and write the physical netlists to generate design checkpoint files that can be opened in Xilinx’s Vivado tool.

## Example flow

The default open source flow for Xilinx devices uses Yosys to synthesize the design and VPR or nextpnr for place and route. The last step – bitstream generation uses the FPGA Assembly [FASM](https://symbiflow.readthedocs.io/en/latest/fasm/docs/specification.html) format to generate the file used for programming the FPGA. FASM is a textual format specifying which FPGA feature should be enabled or disabled. Its textual nature makes it easy to analyze and experiment with. VPR supported this format natively, and nextpnr has been extended to support it as a part of the interchange format support work.

![Supported SymfbiFlow interchange tooling](Interchange_flow.svg)

Now, by using the interchange format, you can create your flow from building blocks, with the possibility to use a different tool (either open source or proprietary) for each step.
A sample, somewhat involved flow which illustrates this mix-and-match nature of interchange-capable tooling may look as described below.

For processing any design, you need the FPGA device description files. These are generated in the following matter:

- RapidWright generates the device description in the Interchange format,
- The device description is translated by a dedicated script into the data-format suitable for nextpnr. The script will be eventually integrated into nextpnr enabling it to read the interchange format device description natively,

The device description has to be generated only once, and will normally be distributed with the toolchain installation package so that the user will not have to bother with this part.

With the device architecture in place, a digital design can be processed with the toolchain:

- Yosys reads design’s Verilog code, synthesizes it and writes a synthesized netlist
- The synthesized netlist is translated into a logical netlist by another script. The script will eventually be integrated into Yosys as the interchange backend,
- Nextpnr places and routes the design and outputs a physical netlist,
- RapidWright reads the physical and logical netlists and produces a Design Checkpoint (DCP) for Vivado,
- Vivado can be used to read the DCP.

Keep in mind this is just one of many possible flows. It is used to test the interchange format interoperability between different tools.

This flow example shows how the Interchange creates a bridge between an open source flow with Yosys and nextpnr, and a closed source one using Vivado – demonstrating the possibility of interchanging tools thanks to a shared format.

To ensure the Interchange format works as intended using all the various currently supported tools, we have developed an [FPGA Interchange tests suite](https://github.com/SymbiFlow/fpga-interchange-tests), which provides tests that expose device features and functionalities.

To push forward the adoption of the format, the effort is being currently transferred from the SymbiFlow project into the [CHIPS Alliance](https://chipsalliance.org/), whose goal is to build an open source ASIC/FPGA ecosystem – including cores, I/O IPs, interconnect standards as well as digital and analog tooling – to radically transform the ASIC/FPGA design landscape.

Apart from allowing various existing tools to interoperate and share development efforts today, the Interchange format is a natural addition to the CHIPS Alliance in that it opens up smart ways to rapidly design and prototype new FPGA architectures, reduce the iteration times to implement, or add support to a place and route tool for a new architecture.

## Plans for the coming months

Besides nextpnr, there are other open source place and route tools slated to adopt the Interchange format as well, such as the Versatile Place and Route (VPR) from the [Verilog-to-Routing project (VtR)](https://github.com/verilog-to-routing/vtr-verilog-to-routing).

Originally intended to perform architectural design exploration to support research in the FPGA field, VtR – and specifically VPR – can be used to place and route designs on real devices as well, such as the Xilinx 7-series and QuickLogic architectures, but only using the VPR data model and device description, as it does not yet support the Interchange format.

One of the next milestones in the development of the Interchange format is the full native support of the format within VPR, therefore enabling something that was previously impossible: performing place and route using different tools interchangeably; jumping, for instance, from VPR placement output to nextpnr routing, allowing for faster improvements in algorithms.

Those benefits will extend to not only VPR and nextpnr, but to any other closed source tools, or new open source ones that adopt and implement the Interchange format.

In fact, having a standard Interchange format at the tooling developers’ disposal lowers the barriers to developing new open source tools in this area and, as example use cases, enable new approaches to partial dynamic reconfiguration, or the exploration of different place and route algorithms.