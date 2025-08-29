---
date: 2021-10-27T00:00:00Z
title: Improving the OpenLane ASIC Build Flow with Open Source SystemVerilog Support
categories:
  - Blog
author: 
images: ['images/blog-share.jpg']
aliases: ['/blog/2021/10/27/improving-the-openlane-asic-build-flow-with-open-source-systemverilog-support/']
tags: [project-update, openlane, openroad, yosys, surelog, uhdm, swerv, ibex, core-v, blackparrot, opemtitan, risc-v]
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2021/10/openlane-asic-build-flow-with-systemverliog-support/).*

Open source toolchains are key to building collaborative ecosystems, welcoming to new approaches, opportunistic/focused innovations and niche use cases. The ASIC design domain, especially in the view of the rising tensions around manufacturing and supply chains, are in dire need of a software-driven innovation based on an open source approach. The fledgling open source hardware ecosystem has been energized by the success of RISC-V and is now being vastly expanded to cover the entire ASIC design flow by [CHIPS Alliance](https://chipsalliance.org/), and Antmicro has been playing a leadership role in both of these organizations as well as offering commercial engineering and support services to assist with early adoption of open source approaches in hardware.

One of CHIPS Alliance’s projects, the DARPA-funded [OpenROAD](https://github.com/The-OpenROAD-Project), has created the necessary tooling to build open source ASIC-oriented flows such as [OpenLane](https://github.com/The-OpenROAD-Project/OpenLane) and [OpenFASoC](https://github.com/idea-fasoc/OpenFASOC), becoming one of the central elements of the open ASIC ecosystem. The OpenROAD project, led by prof. Andrew Kahng from University of California San Diego, aims at a fully end-to-end, RTL-GDSII flow, providing accessibility and collaboration options that are often not available for proprietary tools.

Antmicro is helping early adopters of OpenROAD-based flows, providing development services improving the tools themselves – such as the open source SystemVerilog support described in this note. Our engineering services involve introducing better, open workflows on the design and implementation level, but also scaling up into the cloud in collaboration with [Google Cloud](https://antmicro.com/blog/2021/08/open-source-github-actions-runners-with-gcp-and-terraform/).

There has been a lot of progress recently in the practical adoption of open ASIC design workflows, with most of the effort currently focused around the fully open source [130 nm SkyWater PDK](https://www.skywatertechnology.com/press-releases/google-partners-with-skywater-and-efabless-to-enable-open-source-manufacturing-of-custom-asics/) for the release of which we collaborated with Google, efabless, SkyWater Technologies and many others. What is perhaps less known is that there have been successful tapeouts based on OpenROAD in more modern processes such as GF12 (and together with our customers we are planning more next year), but of course there is a long way to go until the toolchain can be considered a viable replacement for your latest-gen smartphone SoC design. There are, however, serious advantages in favor of an open source ASIC design flow, and to get there, delivering practical value in useful increments is needed. This is why we are working in CHIPS Alliance on making the flow more useful for practical designs.

## Why open source tools for ASIC development?

The hope for open source ASIC flows like OpenLane is to provide multiple benefits:

- enable new, less conventional approaches
- provide more capabilities of vertical integration
- encourage more software-driven and AI-assisted workflows
- use the infinite scalability of the cloud without worrying about licensing costs

In this early and emerging ecosystem, having a commercial support partner like Antmicro which can be relied on for the tools development is important for success – this lets you focus on your design while we take care of the infrastructure needs. Already now there are many niche use cases which can benefit from employing point open source improvements, and our work in CHIPS aims at broadening the application area of open source ASIC design flows to capture the needs of the broader market and bring the benefits of software innovation to hardware. We offer flexible, scalable engineering services to support our customers every step of the way.

## Open Source SystemVerilog support in OpenLane

OpenLane is an automated RTL to GDSII flow that is composed of several tools such as [OpenROAD](https://github.com/The-OpenROAD-Project/OpenROAD), [Yosys](https://github.com/YosysHQ/yosys), [Magic](https://github.com/RTimothyEdwards/magic), [Netgen](https://github.com/RTimothyEdwards/netgen), [Fault](https://github.com/Cloud-V/Fault), [CVC](https://github.com/d-m-bailey/cvc), [SPEF-Extractor](https://github.com/HanyMoussa/SPEF_EXTRACTOR), [CU-GR](https://github.com/cuhk-eda/cu-gr), [Klayout](https://github.com/KLayout/klayout) and a number of scripts used for design exploration and optimization. This collection of tools performs all steps required in a full ASIC implementation from RTL to GDSII.

The flow, depicted below, consists of several highly customizable stages. In the initial stage the RTL source files written in an HDL (Hardware Description Language) are synthesized, technology mapped and analyzed in terms of timing. In the following step the floorplan and power distribution network are prepared for the design placement. Once finished, the design and clock placement is performed followed by global routing. With the physical layout ready in the form of a DEF (Design Exchange Format) file, it’s possible to perform several DRC checks, including Antenna Net or LVS (Layout vs. Schematic), to eventually generate the final GDSII layout file which contains a complete layout description that is now ready to be sent to the foundry.

![Diagram depicting openlane flow](openlane-flow.png)

Our latest improvement in the OpenLane open source ASIC build flow is adding a Surelog/UHDM/Yosys flow that enables SystemVerilog synthesis without the necessity of converting the HDL code to Verilog as an intermediate step.

Yosys is a highly extensible open source HDL synthesis tool used in the RTL synthesis step of the OpenLane flow. Yosys has extensive Verilog-2005 support, but it needs additional plugins to support other languages such as VHDL or SystemVerilog. Previously, SystemVerilog support was only supported with a proprietary plugin, but Antmicro has been involved in adding the SystemVerilog support to Yosys through recent contributions adding UHDM (Universal Hardware Data Model) frontend which has been described in a separate [Blog note](https://antmicro.com/blog/2021/07/open-source-systemverilog-tools-in-asic-design/). UHDM is a file format for storing hardware designs and at the same time a library able to manipulate this format. Designs written in SystemVerilog can be elaborated to the UHDM format by Surelog, which is a tool that aims to be a fully-featured SystemVerilog 2017 preprocessor, parser and elaborator. In our recent efforts both the Surelog parser library and the UHDM library have been integrated with Yosys which essentially enabled seamless SystemVerilog support.

![Diagram depicting surelog/uhmd -> yosys](surelog-uhdm-yosys-diagram.png)

This combination of Surelog/UHDM/Yosys is a very practical improvement for the OpenLane ASIC build flow as it enables using it with a number of existing ASIC designs which are often implemented with SystemVerilog (e.g. [OpenTitan’s](https://github.com/lowRISC/opentitan) [Ibex](https://github.com/lowRISC/ibex)/[Earl Grey](https://github.com/lowRISC/opentitan/tree/master/hw/top_earlgrey) (an SoC based on Ibex), [OHG’s Core-V](https://github.com/openhwgroup/cv32e40s), [University of Washington’s BlackParrot](https://github.com/black-parrot/black-parrot), [CHIPS Alliance’s SWeRV](https://github.com/chipsalliance/Cores-SweRV)).

Together with Google, we are working with relevant communities to prove the feasibility of these designs with our open source flows and the open source SkyWater PDK.

## Building and testing OpenLane with SystemVerilog support

The OpenLane toolchain relies on dockerized tools to implement the flow in practice. This allows the users to focus on building the designs without the necessity of handling complex tools dependencies.

In order to add SystemVerilog support to OpenLane, you need to have a Docker container with Yosys with UHDM support. First you will need to install the OpenLane flow files as well as the PDK (Process Design Kit) files.

```
git clone https://github.com/The-OpenROAD-Project/OpenLane.git
cd OpenLane

make openlane 
make pdk 
cd docker_build/
make build-yosys DOCKER_BUILD_OPTS=--no-cache
make merge
```

Once the tools are built and containers recreated, you can see the tools in action using this example CI run:

```
export IMAGE_NAME=<docker image name>
make test
```

Optionally, you can run the OpenLane container in interactive mode and manually run the OpenLane flow script.

```
export IMAGE_NAME=<docker image name>
make mount
./flow.tcl -design spm 
exit
```

The IMAGE_NAME environment variable selects which Docker image will be used. If not set, a default OpenLane image will be fetched from DockerHub. The default image does not implement the Surelog/UHDM/Yosys flow and will, most likely, fail when used with the synthesis scripts from [the repository](https://github.com/antmicro/openlane/tree/use-yosys-uhdm-plugin).

The Surelog/UHDM flow is very similar to the original (Verilog only) flow, but differs in the way Yosys handles the RTL design. This is because Surelog and UHDM (along with the Yosys UHDM frontend) are packed into a library and loaded into Yosys as a [plugin](https://github.com/antmicro/yosys-symbiflow-plugins/tree/uhdm-plugin/uhdm-plugin). Loading the plugin is one of the [first steps](https://github.com/antmicro/openlane/blob/use-yosys-uhdm-plugin/scripts/synth.tcl#L21) of the synthesis process. Once the plugin is loaded, you can proceed to [loading the RTL files](https://github.com/antmicro/openlane/blob/use-yosys-uhdm-plugin/scripts/synth.tcl#L210) and continue with the rest of the flow.

## Early adoption services for open source in ASIC design

At Antmicro, we are providing services to our customers developing custom ASICs on many levels both IP, tools (Yosys, VPR, OpenROAD, Renode etc.) as well as cloud scaling (distant, custom GitHub runners etc.), focusing on interoperability between the many building blocks needed for a complete ASIC design flow.

Our collaboration with [CHIPS Alliance](https://chipsalliance.org/) partners like Google and Western Digital has been spawning many interesting projects which contributed to maturing the open source ecosystem. Our [linting and formatting](https://antmicro.com/blog/2021/07/open-source-systemverilog-tools-in-asic-design/) work, used by such projects like OpenTitan and Core-V, recently presented at the [CHIPS Alliance Fall Workshop](https://riscv.org/blog/2021/10/recap-of-the-fall-2021-chips-alliance-workshop-rob-mains-chips-alliance/), is a very good example of delivering incremental value with solutions to practical problems. Other projects which enable the blending of old and new methodologies for chip design are the efforts towards [UVM support in Verilator](https://antmicro.com/blog/2021/05/dynamic-scheduling-in-verilator/) or [co-simulation in Renode](https://antmicro.com/blog/2021/09/co-simulation-for-zynq-with-renode-and-verilator/).
