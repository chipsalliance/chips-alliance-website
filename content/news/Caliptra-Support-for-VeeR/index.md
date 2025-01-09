---
date: 2025-01-09T00:00:00Z
title: Caliptra - Support for VeeR EL2 with User Mode and Physical Memory Protection in Tock embedded OS
categories:
  - Blog
author: 
images: ['news/Caliptra-Support-for-VeeR/VeeR-EL2-Tock--blog-sm.png']
aliases: ['/blog/2025/01/10/caliptra-support-for-veer/']
---

The [Caliptra](https://chipsalliance.github.io/Caliptra/) Root of Trust project, a collaboration between AMD, Google, Microsoft and NVIDIA within the [CHIPS Alliance](https://www.chipsalliance.org/), is steadily heading towards its [2.0 release](https://www.chipsalliance.org/news/caliptra-ocp-global-summit-2024/) – an effort Antmicro is [actively contributing to](https://www.youtube.com/watch?v=hXjUoCGlXyM). They’ve recently described their [implementation of User mode](https://antmicro.com/blog/2024/09/user-mode-in-veer-el2-core-for-caliptra-2-0/) in the RISC-V VeeR EL2 core along with extended Physical Memory Protection, and related to this work, they’ve introduced support for VeeR EL2 with User Mode and PMP to the [Tock](https://github.com/tock/tock) embedded OS. The main goal of this implementation was to test the mode switching feature of the VeeR EL2 core with PMP enabled.

In this article we’ll describe implementation details, including Antmicro’s contributions to Tock, [libtock-c](https://github.com/tock/libtock-c) and [tockloader](https://github.com/tock/tockloader). We’ll also show an [example](https://github.com/chipsalliance/VeeR-EL2-tock-example) in which a Tock application running on a VeeR EL2 core simulated in [Verilator](https://www.veripool.org/verilator/) performs forbidden memory accesses, demonstrating that PMP enforces proper User mode constraints.

### Adding new platforms to Tock OS

[Tock](https://tockos.org/) is an embedded operating system written in Rust, designed for running multiple concurrent, mutually distrustful applications on Cortex-M and RISC-V based platforms. As it provides isolation between components to ensure safety and security, it’s a popular choice for Root of Trust projects, such as [OpenTitan](https://antmicro.com/blog/2023/03/adapting-opentitan-for-fpga-prototyping-and-tooling-development/) used e.g. in Google’s [Open Se Cura](https://antmicro.com/blog/2023/11/secure-open-source-ml-with-open-se-cura/) project that Antmicro has also been involved with.

When adding support for a new platform in Tock, we need to consider [three layers of support](https://book.tockos.org/development/porting.html#crate-details): architecture, chip and board. Tock already supports several RISC-V platforms as well as the RISC-V privilege spec with Machine, Supervisor and User modes. When introducing support for VeeR in Tock, we were able to reuse the implementation of RISC-V-specific components, i.e. the general architecture support, machine timer and interrupt controller.

In the chip [crate](https://doc.rust-lang.org/book/ch07-01-packages-and-crates.html#packages-and-crates) ([`veer_el2`](https://github.com/tock/tock/tree/master/chips/veer_el2)), it's necessary to define the components of the chip, and implement the `InterruptService` trait (a trait is equivalent to an interface in the Rust language). This is also where we define the PMP configuration as well as a UART driver for a virtual UART (i.e. not an actual UART core but a dedicated address in the simulation environment, which can be used for printing output from the kernel and applications).

At the time of writing, Tock does not support any “hard” RISC-V implementations, but offers several FPGA and simulation targets, which are also represented by “board” crates. Since this project also focused on simulation testing, the developed VeeR board crate (appropriately called [`veer_el2_sim`](https://github.com/tock/tock/tree/master/boards/veer_el2_sim)) is responsible for initializing all the components available in the chip and the simulation environment. It calls the proper kernel functions to set up the scheduler, timer, console and panic handler, which means that we define what component is supposed to print the error data when an uncorrectable error happens, and loads any applications that are available in the designated memory. This is also where the kernel loop is started.

### Implementing support for VeeR EL2

The goal of this project was to run an application which would test the U and M mode switching feature in the VeeR EL2 core. In the main PR, we added [support for a VeeR EL2 simulation target](https://github.com/tock/tock/pull/4118), but enabling Tock applications on VeeR EL2 required further changes in the Tock ecosystem itself. 

Tock is designed to have applications delivered separately from the kernel, requiring you to compile the kernel, then the applications, and eventually combine them. For the VeeR EL2 target, [we used tockloader](https://github.com/tock/tockloader/pull/117) to first create a binary file representing FLASH memory with the kernel, and then install an application in that file to be able to use it later as input for simulation in Verilator.

Additionally, at the time of writing Tock doesn’t support position-independent code in applications for RISC-V out of the box. As a consequence, when building an application we need to provide the address to which the application will be loaded, which is done via libtock-c (the library for building Tock applications in the C language) by providing predefined addresses for various RISC-V platforms. The PR adding the address map for `veer-el2-sim` [is relatively simple](https://github.com/tock/libtock-c/pull/464/files) and can serve as an example of how this is done. 

With all components ready (Tock, libtock-c, tockloader), we’re able to build the kernel and an application and run it in simulation. The process is explained in detail in the [README](https://github.com/tock/tock/tree/master/boards/veer_el2_sim) for the `veer_el2_sim` target in Tock. For more information about building and running Tock applications on VeeR EL2, refer to the [documentation](https://chipsalliance.github.io/Cores-VeeR-EL2/html/main/docs_rendered/html/tock.html).

### Demo: `VeeR-EL2-tock-example`

To showcase a Tock application running in User mode with PMP configured on a VeeR EL2 core simulated in Verilator, we prepared the [`VeeR-EL2-tock-example` repository](https://github.com/chipsalliance/VeeR-EL2-tock-example). The repository bundles the VeeR EL2 core and Tock, and provides instructions and scripts, allowing users to easily reproduce this setup locally.

The following recording shows how the application tries to overwrite a part of memory that is protected and how the incident is reported in the terminal running the simulation:

![VeeR-EL2-tock-example demo](veer_el2_example.gif)

### Develop open source security IP with Antmicro

Through projects like Caliptra, the “security through obscurity” paradigm is slowly replaced by “security through transparency and collaboration”. Open source OSs and tools like Tock and [Verilator](https://offering.antmicro.com/#/af-verilator) provide the full control and transparency that are necessary in modern security-focused projects, including the Caliptra RoT described in this article. With our [engineering services](https://offering.antmicro.com/#/home), building upon our broad portfolio of open source tools and workflows, Antmicro aims to enable more efficient industry collaboration around silicon.

You can delve deeper into Caliptra in Antmicro’s [System Designer](https://designer.antmicro.com/projects/caliptra_open_source_root_of_trust_soc/overview), an interactive portal aggregating our open source methodologies, workflows and tools, where you can explore Caliptra SoC’s structure, RTL and verification artifacts from a block diagram perspective.

If you want to learn more about Antmicro’s services to help you build your next RISC-V based security solution, don’t hesitate to contact them at [contact@antmicro.com](mailto:contact@antmicro.com).



