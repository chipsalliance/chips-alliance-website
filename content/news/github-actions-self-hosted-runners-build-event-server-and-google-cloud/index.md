---
date: 2021-03-16T00:00:00Z
title: GitHub Actions Self-hosted Runners, Build Event Server and Google Cloud
categories:
  - Blog
author:
images: ['images/blog-share.jpg']
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2021/03/github-actions-self-hosted-runners/).*

Continuous Integration and smart lifecycle management are key for high-tech product development, which is often a complex and multi-faceted process that requires automation to be efficient and failure-proof. At Antmicro, we’ve been creating various open source cloud and hybrid cloud solutions for our customers, helping them to encapsulate the complexity of their software stack. Lots of those projects cross the hardware/software boundary and involve a mix of open source and proprietary code, which means that fine-grained control of the CI setups are needed to make them work.

To provide the level of flexibility that we and our customers require, we often find ourselves working extensively on the underlying CI infrastructure, building open source solutions that can scale between organizations and teams. One such project involved creating a custom, local GitHub Actions runner, with containerized builds, support for Google’s Build Event Server and workload measurement and analytics; in collaboration with Google we then also enabled running an identical setup with the extra capabilities in Google Cloud.

![Self-hosted runner diagram](self-hosted-runners.png)

## Custom runner, more applications

GitHub is the world’s largest open source code sharing space, home to many of our open source projects such as Renode, the open source FPGA toolchain [SymbiFlow](https://github.com/SymbiFlow) or our [open source ASIC development-focused SystemVerilog work](https://antmicro.com/blog/2020/12/ibex-support-in-verilator-yosys-via-uhdm-surelog/). GitHub Actions – used by millions of developers worldwide – is a natural choice for those projects as the go-to CI flow. However, by default it provides compute resources – in the CI world traditionally called runners – with a [specific hardware configuration](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources) which does not always fit the needs of the workloads that we deal with.

Especially in our work that involves ASIC and FPGA development flows – working towards enabling fully open source chip and IP design in our broader work in collaboration with our customers and fellow CHIPS Alliance members such as Google, Western Digital and QuickLogic, we find ourselves needing hybrid setups which would allow us to keep the code as well as the CI definitions public while being able to rely on internal infrastructure to do the heavy lifting. Long-running builds involving tools like [VtR](https://verilogtorouting.org/) or [OpenROAD](https://github.com/The-OpenROAD-Project/OpenROAD) that use lots of memory and CPU power, can greatly benefit from the flexibility that comes with the use of custom, self-hosted runners, and this solution also gives you a high degree of freedom in terms of integrating your runner with external hardware or tools that can’t be shared publicly. The latter is especially helpful in some of our other open source projects for things like benchmarking [RISC-V, OpenPOWER and other cores](https://antmicro.com/blog/2020/09/automatic-cpu-testing-with-embench/) or [tracking the QoR for your FPGA designs](https://github.com/SymbiFlow/fpga-tool-perf). The Quality of Results and flexible Continuous Integration elements are extremely important for custom engineering projects we embark on, which typically integrate a variety of open source components together – fortunately the very nature of open source that constitute the predominant part of the tools we use makes such work much easier.

## Virtual machines, distant-bes and Google Cloud integration

Our internal and our customers’ needs have called for the ability to integrate on-premise runners into our GitHub CI flows, which can be done using the [GitHub runner](https://github.com/actions/runner) project. For many of our projects, we provide flexible development infrastructure based on open source that allows us to better collaborate around shared code and to do that, we need to be able to scale compute resources between the private and public cloud. To enable feature parity with some of internal infrastructure, we also extended the self-hosted runners with some extra features.

Firstly, the custom runners developed as part of the project can be used with our [distant-bes framework](https://antmicro.com/blog/2021/01/viewing-sharing-test-results-with-distant-bes-client/) to push results in the Build Event Server format to custom results viewers transparently to the CI run itself. You can see an example of how this works in the [symbiflow-examples repository](https://github.com/chipsalliance/f4pga-examples). Secondly, we modified the runner so that instead of running the CI script on bare metal, it spawns virtual machines and performs the run steps inside them, collects results, and kills the machine, without changing the state of the host system’s kernel. This also allows us to gather performance metrics to see what the real utilization of the runner’s resources is – and we push those results in the form of graphs to our BES server.

![Runner's resource utilization](resource-usage.png)

Lastly, based on the needs of several of our collaborative open source projects with Google, we pursued yet another goal, namely, instantiating our self-hosted runners in Google Cloud, which enables our CI to spin powerful servers up and down on demand. This mix of robust internal infrastructure and always-available, scalable on-demand Google Cloud resources is very useful for heavy workloads run by multiple organizations. In the world of collaborative development in forums like the CHIPS Alliance and RISC-V International, this is no longer a nice-to-have, but a necessity.