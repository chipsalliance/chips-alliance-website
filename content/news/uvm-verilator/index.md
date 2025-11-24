---
date: 2025-11-24T00:00:00Z
title: Support for upstream UVM 2017 in Verilator
categories:
  - Blog
author: 
images: ['news/uvm-verilator/uvm-verilator.png']
aliases: ['/blog/2025/11/24/uvm-verilator/']
tags: [verilator]
---

[Universal Verification Methodology (UVM)](https://www.accellera.org/community/uvm) is one of the most popular verification methods in digital design, focusing on standardization and reusability of verification IP and environments. For the last few years, Antmicro has been gradually completing milestones toward full UVM support in the open source [Verilator RTL simulator](https://github.com/verilator), from [dynamic scheduling](https://antmicro.com/blog/2021/05/dynamic-scheduling-in-verilator/) (later enhanced with [coroutines](https://antmicro.com/blog/2021/12/coroutines-for-dynamic-scheduling-in-verilator/)) through a [proof-of-concept UVM testbench running in Verilator](https://antmicro.com/blog/2023/10/running-simple-uvm-testbenches-in-verilator/) to [constrained randomization](https://antmicro.com/blog/2024/03/introducing-constrained-randomization-in-verilator/).   

With this article, CHIPS Alliance is happy to announce that Verilator can now elaborate upstream UVM 2017-1.0 - [no patches or workarounds](https://github.com/chipsalliance/uvm-verilator/pull/9) required. This important milestone was spearheaded by Antmicro's efforts within [CHIPS Alliance](https://www.chipsalliance.org/) and complemented by the work of Wilson Snyder, the maintainer of Verilator, as well as the broader open source community.   

The following paragraphs summarize Antmicro's contributions that enabled UVM support in Verilator and describe the most recent developments in the project, including support for features required to enable the examples from the [UVM Cookbook](https://verificationacademy.com/cookbook/uvm-universal-verification-methodology/). A step-by-step tutorial for running Verilator with upstream UVM is also provided.   

### Enhancing Verilator with UVM support and better simulation analysis   

Antmicro’s work with Verilator, be it on new features, bugfixes or enhancements, stems from customer projects, where the CHIPS member is either providing direct commercial support for Verilator as such for our customer's ASIC work, or providing digital design and verification services where we use Verilator alongside other tools, both open and closed. On top of the UVM work described in this article, Antmicro is also making numerous improvements to RTL simulation analysis. From recent examples, to gain more detailed insights into the designs they work with and ensure thorough testing, the team has been improving [coverage reporting](https://antmicro.com/blog/2025/08/enhancing-coverage-reporting-in-verilator/) or adding features like [support for SAIF](https://antmicro.com/blog/2025/07/power-estimation-in-openroad-using-saif-in-verilator/) to enable more efficient power analysis.   

Many of those use cases employ Verilator as a supporting tool, increasing productivity and development speed as well as filling gaps otherwise unserved by other workflows. To push the adoption of Verilator in modern silicon designs beyond its current footprint, especially for verification purposes, solid UVM support is however a must.   

Antmicro has been [steadily contributing to UVM support in Verilator](https://offering.antmicro.com/#/af-verilator) over the past few years, with the ultimate goal being full UVM support, including complex testbenches. To easily track the progress of these efforts, we leverage our [Verilator verification dashboard](https://antmicro.github.io/verilator-verification) and [SystemVerilog test suite](https://chipsalliance.github.io/sv-tests-results), which together (among other things) help visualize the current state of UVM support in Verilator.   

### UVM Cookbook support   

Antmicro's most recent contributions have focused on enabling samples from the UVM Cookbook in Verilator, including support for [generic interfaces](https://github.com/verilator/verilator/pull/6272). They also improved the way Verilator handles parameterized classes: [added](https://github.com/verilator/verilator/pull/6388) a step that resolves default class parameters upon instantiation, and fixed other bugs, such as [parameter dependent type linking](https://github.com/verilator/verilator/pull/6170), [typedef linking](https://github.com/verilator/verilator/pull/6171), and [passing a type as a parameter](https://github.com/verilator/verilator/pull/6543). Additionally, support for [nested classes](https://github.com/verilator/verilator/pull/5778) was added.   

When working on the examples from the Cookbook, the team managed to find a few cases where expression purity was computed incorrectly (a pure expression doesn't contain [side effects](https://en.wikipedia.org/wiki/Side_effect_(computer_science))). Simple purity measurement was added to Verilator a long time ago, and in recent months this was significantly expanded, with fixed [purity calculation of dynamic cast operators](https://github.com/verilator/verilator/pull/6267) and the way [side effects are handled in select expressions](https://github.com/verilator/verilator/pull/6460).   

Building on top of previous work on [constrained randomization in Verilator](https://antmicro.com/blog/2024/08/constrained-randomization-in-verilator-implementation-details/), Antmicro introduced several new features and fixes:
- [Support for randomize..with with complex expressions containing accessing object members](https://github.com/verilator/verilator/pull/6161)
- [Fixing a regression in randomize..with handling](https://github.com/verilator/verilator/pull/6315)
- [Fixing inline constraints with member selects](https://github.com/verilator/verilator/pull/6321)
- [Support for $countones in constraints](https://github.com/verilator/verilator/pull/6235)
- [Support for randomize..with on objects of aliased types](https://github.com/verilator/verilator/pull/6195)
- [Fixing randomize..with for parameterized classes](https://github.com/verilator/verilator/pull/5676)
- [Partial support for size constraints](https://github.com/verilator/verilator/pull/5611)
- [Fixing rand dynamic arrays with null handles](https://github.com/verilator/verilator/pull/5594)
- [Support for rand dynamic arrays of objects](https://github.com/verilator/verilator/pull/5564)

[The way covergroups are handled](https://github.com/verilator/verilator/pull/6160) was improved by enabling the parsing of covergroup constructs and their initial elaboration. This allows you to exclude them from the code to ensure successful tests when the actual tests function properly but lack covergroups support.

Apart from the UVM Cookbook-related contributions, the `disable` statement was also improved, namely disabling blocks by label. Support for most simple cases was added a few years back already, and Antmicro recently enabled it for [cases containing forks](https://github.com/verilator/verilator/pull/6334), including [disabling a fork from within that fork](https://github.com/verilator/verilator/pull/6314), [disabling `begin` blocks that are directly under `fork` blocks](https://github.com/verilator/verilator/pull/6183), and [disabling a fork from outside that fork](https://github.com/verilator/verilator/pull/6174).   

### Running Verilator with upstream UVM   

Previously, Verilator required patches to the UVM source code to elaborate it. Now, thanks to the numerous contributions described in the previous sections, Verilator can elaborate all of UVM 2017-1.0 without any workarounds.

[This repository](https://github.com/antmicro/verilator-uvm-example) contains an example of how to use UVM with Verilator. Clone it using the following command:

```
git clone https://github.com/antmicro/verilator-uvm-example
cd verilator-uvm-example
```

Next, we need to build Verilator. You may need to install some dependencies:   

```
sudo apt update -y
sudo apt install -y bison flex libfl-dev help2man z3
# You may already have these:
sudo apt install -y git autoconf make g++ perl python3
```
Then, clone and build latest Verilator:   

```
git clone https://github.com/verilator/verilator
pushd verilator
autoconf
./configure
make -j `nproc`
popd
```
For the full instructions, visit Verilator's [documentation](https://verilator.org/guide/latest/install.html).

Next, download the UVM code:

```
wget https://www.accellera.org/images/downloads/standards/uvm/Accellera-1800.2-2017-1.0.tar.gz
tar -xvzf Accellera-1800.2-2017-1.0.tar.gz
```

Now, set up the `UVM_HOME` environment variable to point to the extracted UVM sources, and `PATH` to point to Verilator:

```
UVM_HOME="$(pwd)/1800.2-2017-1.0/src"
PATH="$(pwd)/verilator/bin:$PATH"
```
To build the simulation, run:

```
verilator -Wno-fatal --binary -j $(nproc) --top-module tbench_top \
    +incdir+$UVM_HOME +define+UVM_NO_DPI +incdir+$(pwd) \
    $UVM_HOME/uvm_pkg.sv $(pwd)/sig_pkg.sv $(pwd)/tb.sv
```

Finally, run the simulation:   

```
./obj_dir/Vtbench_top +UVM_TESTNAME=sig_model_test
```

### Advancing open source RTL verification with Verilator

While support for upstream UVM 2017 in Verilator marks an important milestone toward a collaborative, software-driven ASIC development ecosystem, Antmicro continues the work to further enhance the implementation. Plans for future improvements include adding support for more testbenches and, eventually, UVM 2020, as well as UVM-adjacent verification features.

You can watch a recording of [Antmicro’s talk at FOSSi Foundation’s ORConf 2025](https://www.youtube.com/watch?v=mO7PZlkLwWY) about this and other recent developments in Verilator. Subscribe to the CHIPS SV Tools Workgroup mailing list (https://lists.chipsalliance.org/g/tools-wg) and feel free to join the bi-weekly open meetings on every other Friday, currently even weeks, at 7 a.m. PT: https://meet.google.com/ncy-rzzp-tfv?hs=122.







