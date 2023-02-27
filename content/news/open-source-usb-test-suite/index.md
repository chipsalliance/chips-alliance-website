---
date: 2019-12-06T00:00:00Z
title: Open Source USB test suite
categories:
  - Blog
author:
images: ['images/blog-share.jpg']
aliases: ['/blog/2019/12/06/open-source-usb-test-suite/']
---

**Note**: the open source test suite will be demonstrated at the CHIPS Alliance booth at the [RISC-V Summit 2019](https://tmt.knect365.com/risc-v-summit/) – join us Dec 10-12 in the San Jose Convention Center!

USB is often a daunting topic for developers, and implementing support for it from scratch is a time consuming task. When the expected result is more complicated than a USB-to-serial bridge, the solution would be to either use a hardware transceiver or, especially for older USB standards, use an open source core to implement one directly in the FPGA fabric. But which core to use?

There are many different USB IP cores available, implemented in languages ranging from traditional HDLs like Verilog to modern alternatives like [migen](https://github.com/m-labs/migen) (or its new variant, [nmigen](https://github.com/m-labs/nmigen)). Most of them come with their own set of test cases, often checking their internal mechanisms and not corresponding directly to those in other projects. What was lacking is a unified test suite that would run each core through the same set of scenarios, providing a direct, apples-to-apples comparison of their behavior.

A solution from [Antmicro](https://antmicro.com/), a CHIPS Alliance Gold member, is an open source test suite for USB IP cores, available [on their Github](https://github.com/antmicro/usb-test-suite-build). It currently supports USB1.1 and will be extended for higher revisions in the future.

In the test suite, Antmicro is making use of several open source technologies that they have come to appreciate through other projects. The tests are implemented using [Cocotb](https://github.com/cocotb/cocotb) and the low-level details are handled by the newly created [cocotb_usb](https://github.com/antmicro/usb-test-suite-cocotb-usb) package. This means that even complicated tests, like those that verify the enumeration procedure under different OSes can be written with easy to understand, Python syntax.

```
from cocotb_usb.harness import get_harness
from cocotb_usb.device import UsbDevice
from cocotb_usb.descriptors import Descriptor

@cocotb.test()
def test_enumeration(dut):
    harness = get_harness(dut)
    yield harness.reset()
    yield harness.connect()

    yield Timer(1e3, units="us")

    yield harness.port_reset(1e3)
    yield harness
          .get_device_descriptor(response=model
              .deviceDescriptor.get())

    yield harness.set_device_address(DEVICE_ADDRESS)
```

## Test suite architecture

As the various IP cores often provide different interfaces towards the user, from different kinds of FIFOs to expected signals to drive the bidirectional USB pins, they are wrapped in a unified layer to create a simple SoC, also written in Python using [LiteX](https://github.com/enjoy-digital/litex). It provides various helper blocks and takes care of the bus infrastructure, clocking and reset logic, generating Verilog output for the whole system ready to be tested under any number of open source simulators. A minimalistic testbench file provides a unified interface as the top object for the simulation.

![USB testing diagram](usb-test-diagram.svg)

## Python package

At the heart of the test suite is `cocotb_usb`, a Python package providing API for sending and receiving various USB packets, handling low-level bus states, verifying descriptor contents and checking timings. This is done by providing a `UsbTest` object that acts as a host and interacts with the device under test. Depending on your needs, you can output single packets, use whole transactions with e.g. automated retries upon receiving “not acknowledged” tokens, or just use high-level functions like `get_config_descriptor()` and let the library handle all the details. Meanwhile, the `UsbDevice` class provides means to store all of the descriptors that the core can report in an organized way.

The test results can be viewed in a standard Cocotb XML results file, the behavior of all signals in the system at all points can be checked in a VCD signal dump (to be viewed e.g. in [GTKWave](http://gtkwave.sourceforge.net/)) and we use open source [sigrok](https://sigrok.org/) decoders to obtain packets and transactions, to be exported for viewing in Wireshark.

![Test results in GTKWave](tinyfpga_gtwave_wireshark.png)

## Current checks

Currently tested cores are:

- [ValentyUSB](https://github.com/im-tomu/valentyusb) – CPU-less IP core written in LiteX, using the eptri interface
- [Foboot](https://github.com/im-tomu/foboot) – target with VexRiscv CPU running bare-metal Foboot firmware (it utilizes the epfifo interface of the ValentyUSB core)
- [usb1_device](https://github.com/www-asics-ws/usb1_device) – a USB1.1 IP core developed by asics.ws in Verilog
- [TinyFPGA USB bootloader](https://github.com/tinyfpga/TinyFPGA-Bootloader) – IP core written in Verilog with interesting features, like providing an interface to program SPI flash memory over USB
- [tnt`s USB IP core](https://github.com/smunaut/ice40-playground/tree/master/cores/usb) – target with a PicoRV32 CPU, running bare-metal firmware interfacing with the Verilog IP core

So, what tests are supported? They range from a simple control packet handling with both [single](https://github.com/antmicro/usb-test-suite-testbenches/blob/master/tests/test-basic.py) and [multiple transfers](https://github.com/antmicro/usb-test-suite-testbenches/blob/master/tests/test-sequence.py), through [handling SOF packets](https://github.com/antmicro/usb-test-suite-testbenches/blob/master/tests/test-sof.py), validating [clock recovery](https://github.com/antmicro/usb-test-suite-testbenches/blob/master/tests/test-clocks.py) in the presence of an imperfect clock signal, to complex enumeration scenarios under [Linux](https://github.com/antmicro/usb-test-suite-testbenches/blob/master/tests/test-enum.py), [Windows 10](https://github.com/antmicro/usb-test-suite-testbenches/blob/master/tests/test-w10enum.py) and [macOS](https://github.com/antmicro/usb-test-suite-testbenches/blob/master/tests/test-macOSenum.py). There are also some special cases, like testing the ValentyUSB core [without a CPU](https://github.com/antmicro/usb-test-suite-testbenches/blob/master/tests/test-eptri.py) by configuring it through a Wishbone bus, or verifying behavior of the TinyFPGA-Bootloader by [using CDC transfers](https://github.com/antmicro/usb-test-suite-testbenches/blob/master/tests/test-cdc.py) to send a boot command to the core.

## Contributing

While full blown documentation is coming soon, there are ways to get involved right now:

- First, to run the test suite, go to the [repository](https://github.com/antmicro/usb-test-suite-build) and follow the steps in the README,
- To write your own test, take a look at [our tests folder](https://github.com/antmicro/usb-test-suite-testbenches/tree/master/tests) and the functions provided by the UsbTest class,
- To run the tests on another IP core, you will need to prepare a simple LiteX wrapper, a config file with expected descriptor values that the core will return and a Makefile that will point to the needed files and provide the needed steps,
- If you would like to test a different USB class that your target supports, head to the [cocotb_usb repository](https://github.com/antmicro/usb-test-suite-cocotb-usb) and feel free to extend it with that class’ descriptors and requests.