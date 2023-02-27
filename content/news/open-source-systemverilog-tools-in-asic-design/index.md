---
date: 2021-08-04T00:00:00Z
title: Open Source SystemVerilog Tools in ASIC Design
categories:
  - Blog
author: 
images: ['images/blog-share.jpg']
aliases: ['/blog/2021/08/04/open-source-systemverilog-tools-in-asic-design/']
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2021/07/open-source-systemverilog-tools-in-asic-design/).*

Open source hardware is undeniably undergoing a renaissance whose origin can be traced to the establishment of RISC-V Foundation (later redubbed RISC-V International). The open ISA and ecosystem, in which Antmicro participated since the beginning as a Founding member, has sparked many open source CPU implementations but also new tooling, methodologies and trends which allow for more collaborative and software driven design.

Many of those broader open hardware activities have been finding a home in [CHIPS Alliance](https://chipsalliance.org/), an open source organization we participate in as a Platinum member alongside Google, Intel, Western Digital, SiFive and others, whose goals explicitly encompass:

- creating and maintaining open source ASIC and FPGA design tools (digital and analog)
- open source core and uncore IP
- interconnects, interoperability specs and more

This is in perfect alignment with Antmicro’s mission, as we’ve been heavily involved with many of the projects inside of and related to CHIPS, providing commercial support and engineering services – and assistance in practical adoption for enterprise deployments.

As of this time, a range of everyday design, development, testing and verification tasks are already possible using open source tools and components and are part of our and our customer’s everyday workflow. Other developments are within reach given a reasonable amount of development, which we can provide based on specific scenarios. Others still are much further away, but with dedicated efforts inside CHIPS in which we are involved together with partners like Google and Western Digital there is a pathway towards a completely open hardware design and verification ecosystem. This will eventually unlock incredible potential in new design methodologies, vertical integration capabilities, education and business opportunities – but until then, practical value can already be extracted today for many scenarios such as simulation, linting, formatting, synthesis, continuous integration and more, and Antmicro can help you do that.

## Building a SystemVerilog ecosystem in CHIPS

Some of the challenges towards practical adoption of open source in ASIC design have been related to the fact that a significant proportion of advanced ASIC design is done in SystemVerilog, a fairly complex and powerful language in its own right, which used to be poorly supported in the open source tooling ecosystem. Partial solutions like SystemVerilog to Verilog converters or paid plugins existed, but direct support lagged behind, making open source tools for SystemVerilog a difficult sell previously.

This has been fortunately changing rapidly with a dedicated development effort spearheaded by Google and Antmicro. Projects in this space include Verible, Surelog, UHDM and [sv-tests](https://github.com/chipsalliance/sv-tests) which we have been developing as well as integrating with existing tools like Yosys, Verilator under the umbrella of the SymbiFlow open source FPGA project, and which are now officially being transferred into the CHIPS Alliance to increase awareness and build a broader SystemVerilog ecosystem around them. In this note, we will walk you through the state of the art in new SystemVerilog capabilities in open source projects, and invite you to reach out to see how CHIPS Alliance’s SystemVerilog projects can be useful to you today or in the near future.

![Diagram depicting SystemVerilog tools](svtoolsdiagram.svg)

## Verible

The [Verible](https://github.com/chipsalliance/verible) project originated at Google, and its main mission is to make SystemVerilog easily and quickly parsable for a wide variety of applications mostly focusing on developer tools.

Verible is a set of tools based on a common SystemVerilog parsing engine, providing a command line interface which makes integration with other tools for daily usage or CI systems for automatic testing and deployment a breeze.

Antmicro has been involved in the development of Verible since its initial open source release and we now provide a significant portion of current development efforts, helping adapt it for use in various open source projects or commercial environments that use SystemVerilog. One notable user is the security-focused [OpenTitan](https://opentitan.org/) project, which has driven many interesting developments and provides a good showcase of the capabilities, being completely open source, well documented, fairly complex and used in real applications.

## Linter

One of the most common use cases for Verible is linting. The linter analyzes code for patterns and constructs that are deemed undesirable according to the implemented lint rules. The rules follow authoritative style guides that can be enforced on a project or company level in various SystemVerilog projects.

The rules range from simple ones like making sure the module name matches the file name to more sophisticated like checking variable naming conventions (all caps, snake case, specific prefix or suffix etc.) or making sure the labels after the begin and end statements match.

A full list of rules can be found in the [Verible lint documentation](https://chipsalliance.github.io/verible/verilog_lint.html) and is constantly growing. Usage is very simple:

```
$ verible-verilog-lint --ruleset all core.sv 
core.sv:3:11: Interface names must use lower_snake_case naming convention and end with _if. [Style: interface-conventions] [interface-name-style]
```

The output of the linter is easy to understand, as the way issues are reported to the user is modeled after popular programming language compilers.

The linter is highly configurable. It is possible to select the rules for which the compliance will be checked, some rules allow for detailed configuration (e.g. max line length).

Rules can also be selectively waived in specific files or at specific lines or even by regex matching. In addition, some rules can be automatically fixed by the linter itself.

## Formatter

The Verible formatter is a complementary tool for the linter. It is used to automatically detect various formatting issues like improper indentation or alignment. As opposed to the linter, it only detects and fixes issues that have no lexical impact on the source code.

The formatter also comes with useful helper scripts for selective and interactive reformatting (e.g. only format files that changed according to git, ask before applying changes to each chunk).

A toolset that consists of both the linter and the formatter can effectively remove all the discussions about styling, preferences and conventions from all pull requests. Developers can then focus solely on the technical aspects of the proposed changes.

```
$ cat sample.sv
typedef struct {
bit first;
        bit second;
bit
   third
        ;
  bit fourth;
bit fifth; bit sixth;
}
 foo_t;


$ verible-verilog-format sample.sv
typedef struct {
  bit first;
  bit second;
  bit third;
  bit fourth;
  bit fifth;
  bit sixth;
} foo_t;
```

## Indexer

The Verible parser itself can be relatively easily used to perform many other tasks. One of the interesting use cases is generating a [Kythe](https://kythe.io/) compatible indexing database.

Indexing a SystemVerilog project makes it very easy to collaborate on a project remotely.
It is possible to navigate through the source code using nothing else than just a web browser.

The Kythe integration can be served on an arbitrary server, can be deployed after every commit in a project, etc. A showcase of the indexing mechanism can be found in our [GitHub repository](https://github.com/antmicro/verible-ibex-indexer). The demo downloads the latest version of the Ibex core, indexes it, and deploys it to be viewed on a remote machine.
The results can be viewed on the [example index webpage](https://antmicro.github.io/verible-ibex-indexer/).

![Demo of SystemVerilog indexing](indexing-systemverilog-demo.png)

Indexing is widely adopted for many larger open source software projects.

Thanks to Verible it is now possible to do the same in the world of open source HDL designs, and of course private, company-wide deployments like this are also possible.

## Surelog and UHDM

SystemVerilog is a powerful language, but it is also complex. That is why so far no open source tools have been able to support it in full. Implementing it separately for each project such as the Yosys synthesis tool or the Verilator simulator would take a colossal amount of time, and that’s where Surelog and UHDM come in.

Surelog, originally created and led by Alain Dargelas, aims to be a fully-featured SystemVerilog 2017 preprocessor, parser, and elaborator. It’s a modern tool and thus follows the current version of the SV standard without unnecessary deviations or legacy baggage.

What’s interesting is that Surelog is only a language frontend designed to integrate well with other tools – it outputs an elaborated design in an intermediate format called UHDM.

UHDM stands for Universal Hardware Data Model, and it’s both a file format for storing hardware designs and a library able to manipulate this format. A client application can access the data using VPI, which is a standard programming interface for SystemVerilog.

What this means is that the work required to create a SystemVerilog parser only needs to be done once, and other tools can use that parser via UHDM. This is much easier than implementing a full SystemVerilog parser within each tool. What’s more, any improvements in the unified parser will provide benefits for all client applications. Finally, any other parser is free to emit UHDM as well, so in the future we might see e.g. a UHDM backend for Verible.

Just like in Verible’s case, both Surelog and UHDM have recently been contributed into CHIPS Alliance to drive a broader adoption. We are actively contributing to both projects, especially around the integrations with tooling such as Yosys and Verilator and practical use in open source and customer projects.

Recent Antmicro contributions adding UHDM frontends for Yosys and Verilator enabled [Ibex](https://github.com/lowRISC/ibex) synthesis and simulation. The complete OpenTitan project is the next milestone.

The Surelog/UHDM/Yosys flow enabling SystemVerilog synthesis without the necessity of converting the HDL code to Verilog is a great improvement for open source ASIC build flows such as OpenROAD’s [OpenLane](https://github.com/The-OpenROAD-Project/OpenLane) flow (which we also support commercially). Removing the code conversion step enables the developers to perform e.g. circuit equivalence validation to check the correctness of the design.

More information about Surelog/UHDM and Verible can be found in a dedicated [CHIPS Alliance presentation](https://www.youtube.com/watch?v=xLxNHBzmGiI) that was recently given by Henner Zeller, Google’s Verible lead.

## UVM is in the picture

No open source ASIC design toolkit can be complete without support for Universal Verification Methodology, or UVM, which is one of the most widespread verification methodologies for large-scale ASIC design. This has also been an underrepresented area in open source tooling and changing that is an enormous undertaking, but working together with our customers, most notably Western Digital, we have been making progress on that front as well.

Across the ASIC development landscape, UVM verification is currently performed with proprietary simulators, but a more easily distributable, collaborative and open ecosystem is needed to close the feedback loop between (emerging) open source design approaches and verification. Verilator is an extremely popular choice for other system development use cases but it has historically not focused on UVM-style verification. Other styles of verification, such as the very interesting and popular Python-based [cocotb framework](https://github.com/cocotb/cocotb) maintained by [FOSSi Foundation](https://antmicro.com/blog/2021/07/open-source-systemverilog-tools-in-asic-design/fossi-foundation.org) have been enabled in Verilator – we write about our own work around that in a [dedicated blog note](https://antmicro.com/blog/2019/06/verilog-with-cocotb-and-verilator/). But support for UVM, partly due to the size and complexity of the methodology, has been a notably absent.

One of the features missing from Verilator but needed for UVM is SystemVerilog stratified scheduling, which is a set of rules specified in the standard that govern the way time progresses in a simulation, as well as the order of operations. In short, a SystemVerilog simulation is divided into smaller steps called time slots, and each time slot is further divided into multiple regions. Specific events can only happen in certain regions, and some regions can reoccur in a single time slot.

Until recently, Verilator had implemented only a small subset of these rules, as all scheduling was being done at compilation time. Spearheading a long-standing development effort within CHIPS Alliance, in collaboration with the maintainer of Verilator, Wilson Snyder, we have built is a proof-of-concept version of Verilator with a dynamic scheduler, which manages the occurrence of certain events at runtime, extending the stratified scheduling support. More details can be found in [Antmicro’s presentation for the inaugural CHIPS Alliance Deep Dive Cafe Talk](https://www.youtube.com/watch?v=s7ivKvXGS74).

Another feature required for UVM is constrained randomization, which allows generating random inputs to feed to a design in order to thoroughly test it. Unlike unconstrained randomization, which is already provided by Verilator, it allows the user to specify some rules for input generation, thus limiting the possible value space and making sure that the input makes sense. Work on adding this to Verilator has already started, although the feature is still in its infancy. There are many other features on the roadmap which will eventually enable practical UVM support – stay tuned with our CHIPS Alliance events to follow that development.

## What next?

Support for SystemVerilog parsers, for the intermediate format, and for their respective backends and integrations with various tooling as well as for UVM is now under heavy development. If you would like to see more effort put into a specific area, reach out to us at contact@antmicro.com. Antmicro offers commercial support services to extend the flows we’ve briefly presented here to various practical applications and designs, and to effectively integrate this approach into people’s workflows.

Adding to this our cloud expertise, Antmicro customers can benefit from a complete and industry-proven methodology scalable between teams and across on-premise and cloud installations, transforming chip design workflows to be more software-driven and collaborative. To take advantage of open source solutions with tools like Verilator, Yosys, OpenROAD and others – tell us about your use case and we will see what can be done today.

If you are interested in collaborating on the development SystemVerilog-focused and other open hardware tooling, [join CHIPS Alliance](https://chipsalliance.org/join/) and participate in our [workgroups](https://chipsalliance.org/workgroups/) and help us push innovation in ASIC design forward.