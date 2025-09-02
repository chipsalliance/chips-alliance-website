---
date: 2020-05-07T00:00:00Z
title: SystemVerilog Linting and Formatting with FuseSoC – Verible Integration
categories:
  - Blog
author: 
images: ['images/blog-share.jpg']
aliases: ['/blog/2020/05/07/systemverilog-linting-and-formatting-with-fusesoc-verible-integration/']
tags: [tutorial, verilog]
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2020/04/systemverilog-linter-and-formatter-in-fusesoc/).*

Although new ASIC design methodologies and tools such as Chisel are on the rise, most ASIC projects still use SystemVerilog, the support of which in open source tools has traditionally lagged behind. This is unfortunate, as using proprietary alternatives with the CI systems of open source projects is neither scalable due to licensing costs and restrictions nor simple due to the need for license management and obfuscation.

Antmicro, Google and the [CHIPS Alliance](https://chipsalliance.org/), which we are members of, have been working together with the [lowRISC project](https://www.lowrisc.org/) to address this issue by implementing relevant tools and useful integrations in the open source domain. One large milestone on this route is Verible, an open source Flex/YACC SystemVerilog parser, linter and formatter recently open sourced by our partner and customer, Google.

Among other developments in that space, Antmicro has been helping to make Verible support some SystemVerilog features required for working with practical use cases, such as lowRISC’s [ibex](https://github.com/lowRISC/ibex), a 32-bit RISC-V core used in the open source security project, [OpenTitan](https://opentitan.org/). But to generate adoption, ease of use is just as important as features, which is why Verible was recently exposed to a wider audience by integrating it with [FuseSoC](https://github.com/olofk/fusesoc).

![](Logos-1024x440.png)

One of the main advantages of an open source linter/formatter is how easy it is to integrate it with existing workflows of open source projects. As it happens, many open source FPGA/ASIC projects, including OpenTitan, are managed with [FuseSoC](https://github.com/olofk/fusesoc), an open source tooling and IP package manager (from our fellow [FOSSi](https://fossi-foundation.org/) veteran Olof Kindgren) which we also use and support. Thanks to the integration of Verible with FuseSoC, linting and formatting automation becomes much easier.

Below you will find a simple example and explanation of how to use the integration The example contains an accompanying CI setup which you can mimic in your own project.

## Demo

We will use [the following example repository](https://github.com/antmicro/fusesoc-verible-demo) to explain the usage of Verible with FuseSoC.
We will show how to build Verible binaries, download ibex – a small 32 bit RISC-V CPU core – and run FuseSoC to perform linting/formatting using Verible.

## Prerequisites

Install the prerequisites (tested on Ubuntu 18.04):

```
sudo apt update
sudo apt install cmake ninja-build wget python3 python3-pip python3-setuptools make tar git
sudo pip3 install fusesoc
```

## Building Verible

Verible can be built using the [Bazel build system](https://bazel.build/).
Bazel is not available in the debian/ubuntu apt repositories. To install Bazel you should add Bazel’s apt repository:

```
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update && sudo apt install bazel
```

To build Verible, a C++11 compatible compiler is required. After the installation of bazel, Verible can be built and installed:

```
git clone https://github.com/google/Verible
cd Verible
bazel build -c opt //...
bazel run :install -c opt -- `pwd`/../Verible_bin
export PATH=`pwd`/../Verible_bin/:$PATH
```

Alternatively, you can download pre-built Verible binaries from the [Verible release page](https://github.com/google/Verible/releases). Refer to the [Verible documentation](https://github.com/google/Verible) and [Bazel installation instructions](https://docs.bazel.build/versions/master/install.html) for more details.

## Running Verible tools with FuseSoC

FuseSoC uses tool backends available in [edalize](https://github.com/olofk/edalize), which is another workflow automation project from the same author that we contribute to regularly. In order to use the Verible tools with FuseSoC you need to define a tool section in the FuseSoC core target file. Ibex already includes the integration, so you can use its [ibex_core.core](https://github.com/lowRISC/ibex/blob/master/ibex_core.core) file as an example.

[![](pMbg6ZZ4X5jYWdC3AXCRYkcSU.svg)](https://asciinema.org/a/pMbg6ZZ4X5jYWdC3AXCRYkcSU)

## Verible linter with FuseSoC on ibex

To perform linting in `ibex_core`, use:

```
git clone https://github.com/lowRISC/ibex
cd ibex
#add Verible lint rules
sed -i '132i\          - "-generate-label"\n          - "-unpacked-dimensions-range-ordering"\n          - "-explicit-parameter-storage-type"\n          - "-line-length"\n          - "-module-filename"\n          - "-no-trailing-spaces"\n          - "-undersized-binary-literal"\n          - "-struct-union-name-style"\n          - "-case-missing-default"\n          - "-explicit-task-lifetime"\n          - "-explicit-function-lifetime"' ibex_core.core

fusesoc --cores-root. run --target=lint --tool=veriblelint lowrisc:ibex:ibex_core:0.1
```

## Verible formatter with FuseSoC on ibex

To format the `ibex_core` with Verible:

```
#add Veribleformat rules
sed -i '154i\          - "--max_search_states"\n          - "10000000"' ibex_core.core
fusesoc --cores-root . run --target=format --no-export lowrisc:ibex:ibex_core:0.1
```

[![](rIjiekwlO2gv8E51ZDzYIETPF.svg)](https://asciinema.org/a/rIjiekwlO2gv8E51ZDzYIETPF)

The demo also shows how the Verible linter can be incorporated into CI pipelines for automatic detection of lint errors. To demonstrate that, a [Pull Request](https://github.com/antmicro/fusesoc-verible-demo/pull/1) containing an intentional lint error has been opened. An automatically executed CI pipeline was able to detect the issues with the code and inform the developers about the failed build status. The output of the lint command can provide useful information about a possible cause of the error. Early detection of lint errors can reduce the number of bugs and improve the overall code quality. Using a linter can accelerate development and reduce costs by finding errors at an early stage of the process. Moreover, incorporating the Verible formatter in CI can also ensure that incoming contributions automatically employ the project’s coding style.

More detailed instructions regarding building and using Verible with FuseSoC can be found in the README file located in the demo repository.

If you are involved in FPGA and ASIC development and want your project to be portable, modular and harness other benefits of a software-driven, open-source-based approach, Antmicro is there to help. As a key service provider in both RISC-V Foundation and CHIPS Alliance, we have lots of readily available SoC building blocks, tools and capabilities to assist you in developing your next product or platform.
