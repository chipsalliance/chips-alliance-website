---
date: 2021-07-20T00:00:00Z
title: "Advanced Co-simulation with Renode and Verilator: PolarFire SoC and FastVDMA"
categories:
  - Blog
author: 
images: ['images/blog-share.jpg']
tags: [project-update, verilator]
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2021/06/advanced-co-simulation-with-renode-and-verilator/).*

[Co-simulating HDL has been possible in Renode since the 1.7.1 release](https://antmicro.com/blog/2019/09/renode-verilator-hdl-co-simulation/), but the functionality – critical for hardware/software co-development as well as FPGA use cases – is constantly evolving based on the needs of our customers like Google and Microchip as well as our work in open source groups including [CHIPS Alliance](https://chipsalliance.org/) and [RISC-V International](https://riscv.org/). To quickly recap, by co-simulation we mean a scenario where a part of the system is simulated in Renode but some specific peripheral or subsystem is simulated directly from HDL, e.g. Verilog. To achieve this, Renode integrates with Verilator, a fast and popular open source HDL simulator, which we are helping our customers adopt as well as expanding its capabilities to cover new use cases. Peripherals simulated directly from HDL are typically called Verilated peripherals.

## Why co-simulate?

Co-simulation is a highly effective approach to testing IP cores in complex scenarios. HDL simulation is typically much slower than functional simulation, so to cut down on development turnaround time you can partition your design into a fixed part that you can simulate fast using Renode and the IP you are developing that you can co-simulate using Verilator. Renode offers a lot of ready-to-use components – for which you do not need to have a hardware description – which can be put together to provide a complete system to test new IP core designs.

## Co-simulation in Renode so far

For more than a year now, Renode has supported using AXI4-Lite and Wishbone buses for the Verilated peripherals’ communication with the rest of the system. As can be seen with the Verilated UART examples included with Renode, these can be used not only to receive data from, but also to send data to the peripheral. Additionally, because Renode can simulate external interfaces, you can easily open a window for such a UART (with `showAnalyzer command` during simulation) and the whole interaction is driven by UART’s TX and RX signals.

![Diagram depicting FastVDMA co-simulation](Co-simulating-FastVDMA-PF-SoC.png)

The `riscv_verilated_liteuart.resc` script shows the interaction between the system based on the VexRiscv CPU implemented in Renode and the UART based on an HDL model simulated with Verilator that together enable users to work with Zephyr’s shell interactively.

In these examples, however, all the communication is initiated from Renode’s side by either reading from or writing to UART. There is no way for the peripheral to trigger the communication, which limited use-cases where the co-simulation could have been used.

## New co-simulation features

Thanks to our work with Microchip and Google, since Renode 1.12 new features are available in the VerilatorPlugin; the most important change is introducing the ability for a Verilated peripheral to trigger communication with other elements of the system. The Renode API was expanded to accommodate the new features. There are now two new actions in the co-simulating communication which enable a Verilated peripheral to initialize communication with Renode by sending data to or requesting data from the system bus.

Support for the AXI4 bus was also added. This is different from the AXI4-Lite bus, which only implements a subset of AXI4 features. The Verilated peripheral can either act on AXI4 bus as a controller that requests accesses (therefore utilizing these new Renode API actions) or as a peripheral (in the AXI4 bus context) that is only requested to take some action.

## How it works

Creating a Renode agent (which handles an HDL model’s connection with Renode) with a role chosen for your peripheral is as simple as including an appropriate header and connecting signals. For example, [FastVDMA](https://opensource.antmicro.com/projects/fastvdma) acts as a controller on AXI4 bus with [the following code in a file creating its Renode agent](https://github.com/antmicro/renode-verilator-integration/blob/master/samples/fastvdma/sim_main.cpp):

```
#include "src/buses/axi-slave.h"
VDMATop *top;

void Init() {
    AxiSlave* slaveBus = new AxiSlave(32, 32);
	
	
    slaveBus->aclk = &top->clock;
    slaveBus->aresetn = &top->reset;

    slaveBus->awid = &top->io_write_aw_awid;
    slaveBus->awaddr = (uint32_t *)&top->io_write_aw_awaddr;

    // Connecting the rest of the signals to the bus
```

Another new feature is the ability to connect the Verilated peripheral through multiple buses. For example, now it’s possible to have a peripheral connected to both AXI4 and AXI4-Lite buses, which enables even more complex HDL models to be tested with Renode. This is the case of the FastVDMA, which is connected this way:

```
#include "src/buses/axi-slave.h"
#include "src/buses/axilite.h"

RenodeAgent *fastvdma;

void Init() {
	AxiLite* bus = new AxiLite();
	AxiSlave* slaveBus = new AxiSlave(32, 32);

	// Initializing both buses’ signals

	//=================================================
	// Init eval function
	//=================================================
	bus->evaluateModel = &eval;
	slaveBus->evaluateModel = &eval;

	//=================================================
	// Init peripheral
	//=================================================
	fastvdma = new RenodeAgent(bus);
	fastvdma->addBus(slaveBus);

	slaveBus->setAgent(fastvdma);
}
```

## FastVDMA

[Fast Versatile DMA (FastVDMA)](https://opensource.antmicro.com/projects/fastvdma) is a Direct Memory Access controller designed with portability and customizability in mind. It is an open source IP core developed by Antmicro in 2019 that is written in [Chisel](https://www.chisel-lang.org/). It is a very versatile DMA controller because of the range of supported buses. It can be controlled through an AXI4-Lite or Wishbone bus while the data can be transmitted through either an AXI4, AXI4-Stream or Wishbone. Since its inception it has been used in a number of projects, e.g., [bringing a GUI to krktl’s snickerdoodle](https://antmicro.com/blog/2020/09/gui-on-zynq-with-fastvdma-hdmi-and-snickerdoodle/). For more information it’s best to head to [the original blog note about FastVDMA](https://antmicro.com/blog/2019/09/fastvdma-open-dma-controller/).

## Expanding the PolarFire SoC ecosystem

Through Antmicro’s long-term partnership with Microchip, Renode is a vital part of the [PolarFire SoC](https://riscv.org/blog/2020/11/polarfire-soc-and-risc-v/) developer experience. Microchip customers are using the [Renode integration with the vendor’s default SoftConsole IDE](https://antmicro.com/blog/2019/04/pr-polarfire-soc-on-renode/) to develop software for the PolarFire SoC platform and it’s development board, the Icicle Kit.

![PolarFire Icicle with Antmicro's HDMI breakout board](icicle-kit-with-antmicro-hdmi-board.jpg)

With the latest co-simulation capabilities, developers are able to explore a combination of hard and soft IP, developing their FPGA payload and verifying it within Renode. This allows them to work on advanced projects, from graphic output support similar to the one we implemented for snickerdoodle with FastVDMA (possibly employing our [open-hardware HDMI board for Icicle Kit](https://antmicro.com/blog/2020/07/polarfire-soc-with-antmicro-hdmi-board/)), through advanced FPGA-based crypto solutions, to [design-space exploration and pre-silicon development](https://antmicro.com/blog/2020/12/precursor-and-renode/), with the debugging and testing capabilities native to Renode.

To see how Renode allows you to simulate complex setups with multiple co-simulated IP blocks, see our tests of [Verilated FastVDMA plus Verilated RAM](https://github.com/renode/renode/blob/master/tests/platforms/verilated/axi.robot).

It’s worth noting that as these blocks are isolated and interconnected only via Renode, you can easily prepare setups in which peripherals use different busses to connect. This gives you an ability to focus on the interesting details and to prepare your systems from building blocks more easily.

## Commercial support

If you’d like to speed up the development of your ASIC or FPGA solution using the advantages of advanced co-simulation, Antmicro offers commercial support and engineering services around Renode, Verilator and other tools, as well as FPGA and ASIC design, hardware, software and cloud services. We work with organizations like [CHIPS Alliance](https://chipsalliance.org/) and [RISC-V International](https://riscv.org/) enable a more software-driven hardware ecosystem based by open source. For a full list of our open source activity, head to our [open source portal](https://opensource.antmicro.com/).
